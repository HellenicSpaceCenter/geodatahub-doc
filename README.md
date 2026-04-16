# Geodatahub Docs

Documentation site for HSC's Geodatahub, built with [MkDocs](https://www.mkdocs.org/) and Material for MkDocs theme.

## Build & Run

All build and serve commands are centralized here.

Install dependencies:

```bash
pip install -r requirements.txt
```

Create environment file (recommended):

```bash
cp .env.example .env
```

Use the scripts from the repository root.

macOS/Linux:

```bash
scripts/build.sh
scripts/serve.sh
```

Windows:

```bat
scripts\build.bat
scripts\serve.bat
```

Output and local URL:

- Build output: `dist`
- Serve URL: `http://localhost:8000`

### Variables

The documentation build reads environment variables through the MkDocs macros plugin (`main.py`) and through the MkDocs plugin configuration (`mkdocs.yml`).

#### Build-time variables

| Variable | Required | Used for | Notes |
| --- | --- | --- | --- |
| `ERM_PRODUCTION_URL` | Recommended | Expands links to the ERM admin and API endpoints inside the generated docs | Used in multiple markdown files through `{{ env.ERM_PRODUCTION_URL }}`. If omitted, the build still completes, but generated pages keep unresolved placeholders instead of valid URLs. |
| `KEYCLOAK_URL` | Recommended | Expands authentication and token endpoint links in API docs | Used through `{{ env.KEYCLOAK_URL }}`. If omitted, the build still completes, but those links are not rendered correctly. |
| `GITHUB_TOKEN` | Optional | Authenticates the `mkdocs-git-committers-plugin-2` plugin | Referenced in `mkdocs.yml` as the token for the `git-committers` plugin. The local build succeeds without it, but contributor metadata may be incomplete or subject to API limits. |

#### Current behavior

- A local build can complete without any of the variables above.
- For a correct rendered site, `ERM_PRODUCTION_URL` and `KEYCLOAK_URL` should be set.
- `GITHUB_TOKEN` improves plugin output, but is not required to produce the site.

#### Not build variables

The following variables exist in the repository but are not required for building the MkDocs site itself:

- `DOCS_USERNAME`
- `DOCS_PASSWORD`

These are only used by the Docker/Nginx container at runtime for basic authentication when serving the already-built static site.
    