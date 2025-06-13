// lib/apiClient.js
export default class ApiClient {
  constructor(baseURL) {
    this.baseURL = baseURL;
  }

  _buildOptions(method, body, extraHeaders = {}) {
    const token = typeof window !== 'undefined'
      ? localStorage.getItem('token')
      : null;

    // Detecta FormData
    const isFormData = body instanceof FormData;

    const headers = {
      ...(!isFormData && { 'Content-Type': 'application/json' }), 
      ...extraHeaders,
    };
    if (token) headers.Authorization = `Bearer ${token}`;

    const opts = { method, headers };
    if (body !== undefined) {
      opts.body = isFormData 
        ? body 
        : JSON.stringify(body);
    }
    return opts;
  }

  async request(endpoint, method = 'GET', body, extraHeaders = {}) {
    const res = await fetch(
      `${this.baseURL}${endpoint}`,
      this._buildOptions(method, body, extraHeaders)
    );
    const text = await res.text();
    let data;
    try { data = text ? JSON.parse(text) : null; }
    catch { data = text; }

    if (!res.ok) {
      const err = new Error(data?.message || res.statusText);
      err.status = res.status;
      err.payload = data;
      import('@/utils/show_message').then(({ showToast }) => {
        showToast('error', err.message);
      });
      throw err;
    }
    return data;
  }

  get(endpoint, params = {}) {
    const qs = new URLSearchParams(params).toString();
    return this.request(endpoint + (qs ? `?${qs}` : ''), 'GET');
  }

  post(endpoint, body, extraHeaders = {}) {
    return this.request(endpoint, 'POST', body, extraHeaders);
  }

  put(endpoint, body, extraHeaders = {}) {
    return this.request(endpoint, 'PUT', body, extraHeaders);
  }

  delete(endpoint) {
    return this.request(endpoint, 'DELETE');
  }
}
