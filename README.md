# Appwrite Wellknown Function

Provides an Appwrite project configuration object for dynamic Appwrite client configurations.

## 🧰 Usage

### GET /

Returns the Appwrite project configuration with Id's and the corresponding names of the Appwrite objects.

**Response**

Sample `200` Response:

```json
{
  "min_client_version": "1.5.6",
  "project_id": "653e6279d0fe7c6ca484",
  "endpoint": "https://cloud.appwrite.local/v1",
  "databases": [
    {
      "id": "b3702b6afd3442fcbec49bc7f8ea6c14",
      "name": "First Database Database",
      "collections": [
        {
          "id": "003dea0315154e688aa0d68c2e10bc95",
          "name": "Migrations"
        },
        {
          "id": "b2637951931c41e7a8e555e00e516010",
          "name": "User Profiles"
        }
      ]
    },
    {
      "id": "653d20f132c550f56d7f",
      "name": "AnyWay Database",
      "collections": [
        {
          "id": "653d2112576d21b01008",
          "name": "First Fancy Collection"
        },
        {
          "id": "653d21253b5f590a0a25",
          "name": "Second Fancy Collection"
        }
      ]
    }
  ]
}
```

Sample `404` Response

A 404 response can occur if, for example, the x-wk-token header is not present, or its value is not valid

```text
return empty body
```

## 🏢 Deployment

[See Appwrite Documentation](https://appwrite.io/docs/products/functions#)

## ⚙️ Configuration

| Setting           | Value           |
|-------------------|-----------------|
| Runtime           | Dart (3.0)      |
| Entrypoint        | `lib/main.dart` |
| Build Commands    | `dart pub get`  |
| Permissions       | `any`           |
| Timeout (Seconds) | 15              |

## 🔒 Environment Variables


| Variable                     | Description                                                                                           |
|------------------------------|-------------------------------------------------------------------------------------------------------|
| WELLKNOWN_FUNCTION_API_KEY   | Appwrite API Key with read Permissions to Databases                                                   |
| APPWRITE_ENDPOINT            | Appwrite endpoint for the Appwrite client in the Wellknown Function e.g. https://cloud.appwrite.io/v1 |
| APPWRITE_PROJECT_ID          | Project Id for the Appwrite Client in the Wellknown Function                                          |
| WELLKNOWN_TOKEN              | Expected token in the `x-wk-token` Header                                                             |
| WELLKNOWN_MIN_CLIENT_VERSION | Minimum client version to interact with this Appwrite project                                         |
