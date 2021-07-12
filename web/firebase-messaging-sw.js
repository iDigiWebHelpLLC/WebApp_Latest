// console.log("")
importScripts("https://www.gstatic.com/firebasejs/8.4.1/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.4.1/firebase-messaging.js");

/*if ('serviceWorker' in navigator) {
navigator.serviceWorker.register('/firebase-messaging-sw.js')
  .then(function(registration) {
    console.log('Registration successful, scope is:', registration.scope);
  }).catch(function(err) {
    console.log('Service worker registration failed, error:', err);
  });
}*/

const firebaseConfig = {
  apiKey: "AIzaSyB-yhZWm2f8EkKhh8tJo1vvp1OUnfG_yHk",
  authDomain: "mymobileserviceapp.firebaseapp.com",
  databaseURL: "https://mymobileserviceapp.firebaseio.com",
  projectId: "mymobileserviceapp",
  storageBucket: "mymobileserviceapp.appspot.com",
  messagingSenderId: "792418774247",
  appId: "1:792418774247:web:a1f8dfcf0e167c2d5d0642",
  measurementId: "G-Z211PBX2YG"
};

firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();
messaging.setBackgroundMessageHandler(function (payload) {
    const promiseChain = clients
        .matchAll({
            type: "window",
            includeUncontrolled: true
        })
        .then(windowClients => {
            for (let i = 0; i < windowClients.length; i++) {
                const windowClient = windowClients[i];
                windowClient.postMessage(payload);
            }
        })
        .then(() => {
            const title = payload.notification.title;
            const options = {
                body: payload.notification.score
              };
            return registration.showNotification(title, options);
        });
    return promiseChain;
});
self.addEventListener('notificationclick', function (event) {
    console.log('notification received: ', event)
});