### Authenticate against the ERM

The harvester needs to first authenticate against Keycloak (using client credentials) to obtain a JWT token. This token is passed in the `Authorization` header of all requests to the ERM. The following code evaluates the token and assesses whether the request should be allowed or not.

```python
class IsHarvester(BasePermission):
    def has_permission(self, request, view):
        if "Authorization" in request.headers:
            token = request.headers["Authorization"].split("Bearer ")[1]
        else:
            return False

        if not token:
            return False

        decoded_token = jwt.decode(token, options={"verify_signature": False})
        return decoded_token.get("azp") == os.environ.get("HARVESTER_KEYCLOAK_CLIENT_ID")
```

The crucial part is the `azp` claim, which is set to, e.g. `harvester-server` in Keycloak. This claim is used to identify the harvester and allow it to access the ERM API.
> HARVESTER_KEYCLOAK_CLIENT_ID is the client ID of the harvester in Keycloak. This is set in the environment variable `HARVESTER_KEYCLOAK_CLIENT_ID`. We must agree on a convention for this, until all system components are deployed on Kubernetes.


### Register harvester events

Events emitted from the harvester are passed to the ERM via a webhook, specifying the _entity_id_ (the resource ID the event refers to, a _uuid4_) and the _event_type_ (e.g. `EVENT_HARVESTER_SUCCESS`, `EVENT_S3_OBJECTS_COMPRESS_SUCCESS`, etc.). The ERM will resolve the type of the entity from the event type. The ERM will then query the harvester for the resource ID and update the entity status and other relevant fields (e.g. deliverable paths) accordingly.

The webhook can be accessed at `/api/external/harvester/register-event/` and requires a `POST` request with the following JSON body:

```json
{
  "entity_id": "UUID4", // string: uuid4
  "event_type": "harvested" // string: harvester_event_enum member
}
```

Returns a 201 Event Received response if the event was successfully registered.

The following event types are emitted by the Harvester:

| Event Type                        | Description                                               | Entity Type    |
|:----------------------------------|:----------------------------------------------------------|:---------------|
| EVENT_HARVESTER_SUCCESS           | Harvester operation has completed successfully            | Order          |
| EVENT_HARVESTER_FAILURE           | Harvester operation has failed                            | Order          |
| EVENT_S3_OBJECTS_COMPRESS_SUCCESS | S3 objects compression request has completed successfully | Deliverable    |
| EVENT_S3_OBJECTS_COMPRESS_FAILURE | S3 objects compression request has failed                 | Deliverable    |

### Submit an order to the harvester

The ERM will submit an order to the harvester via API, specifying the _order_id_ (order ID for which data is being harvested, a _uuid4_) and the S3 path to the raw data. The harvester will then process the order.

Submission is triggered by an operator via the respective UI (implemented as step in the order flow). In case the harvesting process fails, the operator will be notified via the UI and/or email, and will then be able to re-submit the order to the harvester.

An order can be submitted at `{{flowable-url}}/action/process-instances` using the `POST` HTTP method with a request body as shown next. Although the property `businessKey`
and the variable `order_id` have the same value, both **MUST** be set.

```json
{
    "businessKey": "{{flowable-business-key}}",
    "processDefinitionKey": "bpmn-process-eo-data",
    "variables": [{
        "name": "provider",
        "value":"PLANET_SCOPE",
        "type": "STRING"
    },{
        "name": "s3_path",
        "value":"PlanetScope/athens_basic_analytics",
        "type": "STRING"
    }, {
        "name": "order_id",
        "value":"{{flowable-business-key}}",
        "type": "STRING"
    }]
}
```

The provider can be one of the following values:

| Key              | Provider           | STAC Collection    |
|:-----------------|:-------------------|:-------------------|
| AIRBUS           | Airbus             | Airbus             |
| CADASTRE         | Cadastre           | Cadastre           |
| CAPELLA          | Capella            | Capella            |
| ICEYE            | ICEYE              | ICEYE              |
| MAXAR            | Maxar              | Maxar              |
| ORORA_TECH       | OroraTech          | OroraTech          |
| PLANET_SCOPE     | PlanetScope        | PlanetScope        |
| SKY_SAT          | SkySat             | SkySat             |

### Submit a request to compress deliverable files to the Harvester

The ERM will submit a request to the harvester via API, specifying the _order_id_ (order ID of the deliverable, a _uuid4_), _deliverable_id_ (the deliverable unique ID, a _uuid4_) and the S3 paths for the objects to process. The harvester will then process the request.

A request can be submitted at `{{flowable-url}}/extensions/erm/orders/{{order-id}}/deliverables/{{deliverable-id}}` using the `POST` HTTP method with a request body as shown next. The operation will preserve the file system hierarchy in the ZIP archive.

```json
{
    "files": [
        "Satellite-Data/OroraTech/20240716_0212/F002_L1__IR__L2L1M0__2024-07-15T231153.038502Z_2024-07-17T215808.919232Z_3a655040_1721253590.557983_DG-Img2Map-IR1_0.4.0_afd06dabb0ab58d5_LWIR1.tif",
        "Satellite-Data/OroraTech/20240716_0212/F002_L1__IR__L2L1M0__2024-07-15T231153.038502Z_2024-07-17T215808.919232Z_3a655040_1721253590.557983_DG-Img2Map-IR1_0.4.0_afd06dabb0ab58d5_LWIR2.tif",
        "Satellite-Data/OroraTech/Forest-2_GR_18_20-07-2024/2024-07-19T23-29-22ZUTC.png"
    ]
}
```

The new process instance business key is set to the value of the `deliverable-id`.

### Query harvester for process instance results

The ERM must be able to query the harvester, to retrieve the processing status of a request, as well as STAC item URLS/IDs upon completion. Additional metadata may also be included on the completion request, or read from the STAC (up for discussion).

The results of a Harvester operation can be retrieved at `{{flowable-url}}/extensions/erm/process-instances/{{business-key}}/results` using the `GET` HTTP method.

The result depends on the type of the process instance.

- A sample for a EO data processing request can be found [here](./services/harvester/samples/harvester-sample-response-plantescope.json).
- A sample for a deliverable ZIP archive can be found [here](./services/harvester//samples/harvester-sample-response-s3-objects-compression.json).

| Process                          | Business Key              |
|:---------------------------------|:--------------------------|
| EO Data Processing               | The order unique ID       |
| S3 Objects Compressions          | The deliverable unique ID |