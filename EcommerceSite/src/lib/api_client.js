// lib/apiClient.js
export default class ApiClient {
  constructor(baseURL) {
    this.baseURL = baseURL;
  }

  // Interno: añade headers comunes (JSON, JWT si existe)
  _buildOptions(method, body, extraHeaders = {}) {
    const token = typeof window !== 'undefined'
      ? localStorage.getItem('token')
      : null;

    const headers = {
      'Content-Type': 'application/json',
      ...extraHeaders,
    };
    if (token) headers.Authorization = `Bearer ${token}`;

    const opts = { method, headers };
    if (body !== undefined) opts.body = JSON.stringify(body);
    return opts;
  }

  async request(endpoint, method = 'GET', body) {
    const res = await fetch(`${this.baseURL}${endpoint}`, 
      this._buildOptions(method, body)
    );
    const text = await res.text();
    let data;
    try { data = text ? JSON.parse(text) : null; }
    catch { data = text; }

    if (!res.ok) {
      const err = new Error(data?.message || res.statusText);
      err.status = res.status;
      err.payload = data;
      throw err;
    }
    return data;
  }

  get(endpoint, params = {}) {
    // construye query string si params no vacío
    const qs = new URLSearchParams(params).toString();
    return this.request(endpoint + (qs ? `?${qs}` : ''), 'GET');
  }
  post(endpoint, body, extraHeaders) {
    return this.request(endpoint, 'POST', body, extraHeaders);
  }
  put(endpoint, body, extraHeaders) {
    return this.request(endpoint, 'PUT', body, extraHeaders);
  }
  delete(endpoint) {
    return this.request(endpoint, 'DELETE');
  }
}
