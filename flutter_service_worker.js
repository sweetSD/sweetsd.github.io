'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"assets/FontManifest.json": "7af216f9958fda416eacf1177f35fcbf",
"assets/AssetManifest.bin.json": "7be497d50698443b069f0934c3ddf5bb",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/fonts/AppleSDGothicNeoEB.ttf": "eaafc4677b0f252b3404c5268e0eb26d",
"assets/assets/fonts/AppleSDGothicNeoB.ttf": "018066fbccbce3cc4bbba5d3ac4f1033",
"assets/assets/fonts/AppleSDGothicNeoL.ttf": "b07ac29c8c063198e384a69bfe91c975",
"assets/assets/fonts/AppleSDGothicNeoR.ttf": "85ba110e6b8d4c2e961f21ef648d27ea",
"assets/assets/images/cs_server/%25EC%258A%25AC%25EB%259D%25BC%25EC%259D%25B4%25EB%2593%259C14.PNG": "306fb3775834f24b68e00a3471e2ed2e",
"assets/assets/images/cs_server/%25EC%258A%25AC%25EB%259D%25BC%25EC%259D%25B4%25EB%2593%259C7.PNG": "68cbb31286e521cd2f38aebf35235325",
"assets/assets/images/cs_server/%25EC%258A%25AC%25EB%259D%25BC%25EC%259D%25B4%25EB%2593%259C12.PNG": "e47ea3ad5bae2001aeecf210f7772c9e",
"assets/assets/images/cs_server/%25EC%258A%25AC%25EB%259D%25BC%25EC%259D%25B4%25EB%2593%259C16.PNG": "974c3297635d44bcfaa9c8784137b970",
"assets/assets/images/cs_server/%25EC%258A%25AC%25EB%259D%25BC%25EC%259D%25B4%25EB%2593%259C4.PNG": "e0ef654768a32b72897510119e316593",
"assets/assets/images/cs_server/%25EC%258A%25AC%25EB%259D%25BC%25EC%259D%25B4%25EB%2593%259C11.PNG": "4bc643f9af669ebc83783b3e812f5460",
"assets/assets/images/cs_server/%25EC%258A%25AC%25EB%259D%25BC%25EC%259D%25B4%25EB%2593%259C15.PNG": "215ec70bf6084ee30c3373fa4e167f7b",
"assets/assets/images/cs_server/%25EC%258A%25AC%25EB%259D%25BC%25EC%259D%25B4%25EB%2593%259C17.PNG": "8d30a51c4dbb351c77fb7f153727dbff",
"assets/assets/images/cs_server/%25EC%258A%25AC%25EB%259D%25BC%25EC%259D%25B4%25EB%2593%259C6.PNG": "ac12673c9b68829f0aea37bb7d5aa002",
"assets/assets/images/cs_server/%25EC%258A%25AC%25EB%259D%25BC%25EC%259D%25B4%25EB%2593%259C5.PNG": "255c8169ee773251a18b70757443036d",
"assets/assets/images/cs_server/%25EC%258A%25AC%25EB%259D%25BC%25EC%259D%25B4%25EB%2593%259C8.PNG": "2989e564855d0509ebe84d712f1c199e",
"assets/assets/images/cs_server/%25EC%258A%25AC%25EB%259D%25BC%25EC%259D%25B4%25EB%2593%259C9.PNG": "1b84126d5cd9e338bff4a31d19e1f861",
"assets/assets/images/cs_server/%25EC%258A%25AC%25EB%259D%25BC%25EC%259D%25B4%25EB%2593%259C3.PNG": "049ed2b72b8b9752e982922eb49eadbe",
"assets/assets/images/cs_server/%25EC%258A%25AC%25EB%259D%25BC%25EC%259D%25B4%25EB%2593%259C2.PNG": "f2d1128b1c349f115ff52e74d9857511",
"assets/assets/images/cs_server/%25EC%258A%25AC%25EB%259D%25BC%25EC%259D%25B4%25EB%2593%259C10.PNG": "833605840b48fd67104c236385d294a3",
"assets/assets/images/cs_server/%25EC%258A%25AC%25EB%259D%25BC%25EC%259D%25B4%25EB%2593%259C1.PNG": "37b904b7d9fed90f16e1bed0a1e42b05",
"assets/assets/images/cs_server/%25EC%258A%25AC%25EB%259D%25BC%25EC%259D%25B4%25EB%2593%259C13.PNG": "f3362335a8c04133b279494910518d9c",
"assets/assets/images/icons/ic_play_store.png": "d67d4155c9f378c3f6143c1fdcefa115",
"assets/assets/images/icons/ic_linked_in.jpg": "edea2a26a5a75a258f9d0ab1c7f0ab98",
"assets/assets/images/icons/ic_naver_blog.png": "66ebb8baf0db57a91898ba52377e63bb",
"assets/assets/images/icons/ic_github.png": "bb04d77a846e6beca811c4be1d8e3442",
"assets/assets/images/test.png": "f2892ed8d414091d9875e8bce8d0eb0e",
"assets/assets/images/test.webp": "34a21fc17b5ae416e32bddd0e33983f7",
"assets/assets/data/app.json": "7c784255bed83061c2449b3ea1ab36ad",
"assets/assets/data/game.json": "17c4a7024b15887df3537e9e7e5ebbf5",
"assets/assets/data/info.json": "6adf8c11a9630a065fd653a41c5630ed",
"assets/fonts/MaterialIcons-Regular.otf": "2c5f5f30fb1b5edbe443d361dded8990",
"assets/AssetManifest.bin": "11f9ee5a5547c2a4c273d94fe7a3b6ce",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/AssetManifest.json": "e6f8ea9cd7654d1ba1c5081b1133a85c",
"assets/NOTICES": "cff191db02c39b5e7c3c3c0c864fd9d1",
"index.html": "a883169033d270aa7e01fbf4f20f0072",
"/": "a883169033d270aa7e01fbf4f20f0072",
"main.dart.js": "80c31888c08d9d311ef331eafa852aa5",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "256d8a26bfc34aa2ff29a0a98a538b76",
"flutter_bootstrap.js": "fb062ff8f3e0e27b04d54b09ff9fb656",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "87325e67bf77a9b483250e1fb1b54677",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.js": "5fda3f1af7d6433d53b24083e2219fa0",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "9fa2ffe90a40d062dd2343c7b84caf01",
"manifest.json": "b1e21b9c119684bb5c38b64fd9a326eb",
"flutter.js": "f31737fb005cd3a3c6bd9355efd33061"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
