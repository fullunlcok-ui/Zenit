/**
 * ZENITH SERVICE WORKER v4.0
 * Arsitek: Sebastian
 * Deskripsi: Menangani caching aset untuk performa offline dan kecepatan muat instan.
 */

const CACHE_NAME = 'zenith-cloud-v4';
const ASSETS_TO_CACHE = [
  './',
  './index.html',
  './manifest.json',
  'https://cdn.tailwindcss.com',
  'https://cdn.jsdelivr.net/npm/lucide@0.321.0/dist/umd/lucide.min.js',
  'https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700;800&display=swap'
];

// Tahap Instalasi: Menyimpan aset inti ke dalam cache sistem
self.addEventListener('install', (event) => {
  event.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      console.log('Zenith Cache: Inisialisasi aset utama berhasil.');
      return cache.addAll(ASSETS_TO_CACHE);
    })
  );
});

// Tahap Aktivasi: Membersihkan residu cache versi lama untuk menjaga integritas data
self.addEventListener('activate', (event) => {
  event.waitUntil(
    caches.keys().then((cacheNames) => {
      return Promise.all(
        cacheNames.map((cache) => {
          if (cache !== CACHE_NAME) {
            console.log('Zenith Cache: Menghapus data usang.');
            return caches.delete(cache);
          }
        })
      );
    })
  );
});

// Strategi Fetch: Mengutamakan jaringan, beralih ke cache jika offline (Network First)
self.addEventListener('fetch', (event) => {
  event.respondWith(
    fetch(event.request).catch(() => {
      return caches.match(event.request);
    })
  );
});
