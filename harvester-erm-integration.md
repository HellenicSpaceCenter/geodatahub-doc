

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

Events emitted from the harvester are passed to the ERM via a webhook, specifying the _entity_id_ (order ID for which data is being harvested, a _uuid4_) and the _event_type_ (e.g. `harvested`, `harvesting_failed`, etc.). The ERM will then query the harvester for the order ID and update the order status and other relevant fields (e.g. deliverable paths) accordingly.

The webhook can be accessed at `/api/external/harvester/register-event/` and requires a `POST` request with the following JSON body:

```json
{
  "entity_id": "UUID4", // string: uuid4
  "event_type": "harvested" // string: harvester_event_enum member
}
```

Returns a 201 Event Received response if the event was successfully registered.



### Submit an order to the harvester

The ERM will submit an order to the harvester via API, specifying the _entity_id_ (order ID for which data is being harvested, a _uuid4_) and the S3 path to the raw data. The harvester will then process the order. 

Submission is triggered by an operator via the respective UI (implemented as step in the order flow). In case the harvesting process fails, the operator will be notified via the UI and/or email, and will then be able to re-submit the order to the harvester.

`... Awaiting API documentation (EOFarm)...`


### Query harvester for order data

The ERM must be able to query the harvester, to retrieve the processing status of an order, as well as STAC item URLS/IDs upon completion. Additional metadata may also be included on the completion request, or read from the STAC (up for discussion).

`... Awaiting API documentation (EOFarm)...`