/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const {onRequest} = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");
const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.sendNotificationOnVideoUpload = functions.firestore
    .document('videos/Firebase/{subCollection}/{videoID}') // Dynamically match any sub-collection
    .onCreate(async (snap, context) => {
        const videoData = snap.data();
        const uploadedBy = videoData.uploadedBy;

        // Check if the uploader is the admin
        if (uploadedBy === "admin@gmail.com") {
            const title = videoData.title;

            // Get all user tokens except the admin
            const usersSnapshot = await admin.firestore().collection('users').get();
            const tokens = [];

            usersSnapshot.forEach((doc) => {
                const user = doc.data();
                if (user.email !== "admin@gmail.com" && user.fcmToken) {
                    tokens.push(user.fcmToken);
                }
            });

            if (tokens.length > 0) {
                // Notification payload
                const payload = {
                    notification: {
                        title: "New Video Uploaded!",
                        body: `Admin uploaded a new video: ${title}`,
                    },
                };

                // Send notifications to devices
                await admin.messaging().sendToDevice(tokens, payload);
                console.log("Notifications sent to users.");
            }
        }
    });

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
