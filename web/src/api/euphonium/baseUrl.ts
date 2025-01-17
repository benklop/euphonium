export default function getBaseUrl() {
  let apiUrlFromEnv = import.meta.env.VITE_API_URL || "";

  if (apiUrlFromEnv) {
    return apiUrlFromEnv.toString();
  }

  if (import.meta.env.MODE !== "production") {
    return "http://localhost";
  }

  return "";
}
