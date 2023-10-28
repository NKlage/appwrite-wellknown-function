# wellknown

## 🧰 Usage

### GET /

- Returns a "Hello, World!" message.

**Response**

Sample `200` Response:

```text
Hello, World!
```

### POST, PUT, PATCH, DELETE /

- Returns a "Learn More" JSON response.

**Response**

Sample `200` Response:

```json
{
  "motto": "Build like a team of hundreds_",
  "learn": "https://appwrite.io/docs",
  "connect": "https://appwrite.io/discord",
  "getInspired": "https://builtwith.appwrite.io"
}
```

## ⚙️ Configuration

| Setting           | Value           |
|-------------------|-----------------|
| Runtime           | Dart (3.0)     |
| Entrypoint        | `lib/main.dart` |
| Build Commands    | `dart pub get`  |
| Permissions       | `any`           |
| Timeout (Seconds) | 15              |

## 🔒 Environment Variables

No environment variables required.

| Variable                     | Description                                                                                           |
|------------------------------|-------------------------------------------------------------------------------------------------------|
| WELLKNOWN_FUNCTION_API_KEY   | Appwrite API Key with all read Permissions to Databases                                               |
| APPWRITE_ENDPOINT            | Appwrite endpoint for the Appwrite client in the Wellknown Function e.g. https://cloud.appwrite.io/v1 |
| APPWRITE_PROJECT_ID          | Project Id for the Appwrite Client in the Wellknown Function                                          |
| WELLKNOWN_TOKEN              | Expected token in the X-WK-Token Header                                                               |
| WELLKNOWN_MIN_CLIENT_VERSION | Minimum client version to interact with this Appwrite project                                         |
