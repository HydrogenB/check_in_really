
Flutter application for single use.
Project Name: Check In Really
Purpose:
To create an internal mobile event app for employees to check in at 7 physical locations. The app will confirm check-ins via geolocation, and upon success, it will retrieve and display an achievement title via API.

🧩 Key Features
Feature	Description
Location-Based Check-In	App detects the user's GPS location to validate check-in.
Check-In Confirmation	If location is within range, show animation + success message + achievement title.
Achievement API Call	After check-in, the app sends an API call and displays the returned achievement title.
7 Unique Locations	Each point has unique coordinates.
Progress Tracker	Display user progress (e.g., 3/7 completed) visually like a progress bar or achievement wheel.
Gamified UI	Friendly animations, icons, maybe confetti on full completion.
Admin Config Panel (Optional)	To manage location coordinates and event dates (future-proofing).
🎯 Experience Design Goals
Simple: One-tap check-in with no friction.

Motivating: Celebrate every check-in with animations.

Visual: Clear map + location progress tracking.

Fast: API call with achievement is fast and clear.

Offline-Aware: Graceful fallback or prompt when location/GPS is off.

📱 UX/UI Design Flows
🔹1. Home Screen
Header: "Check In Really"

Progress Indicator: 7 dots, filled when completed.

CTA Button: "Check In Now"

Map View (optional): Show nearby check-in points.

Settings Icon: For language/GPS/help.

🔹2. Check-In Screen
Permission Check: Ask for location permission (if not yet granted).

Check-in Button (Disabled/Enabled based on proximity)

Status: “You’re here!” or “You’re too far.”

Check-in Animation: Pulsing check-in icon or radar effect.

API Call: Show loading → display returned achievement title.

Toasts/Snackbar: “Congrats! You unlocked: [Title]”

🔹3. Achievements Screen
List/Grid of 7: Each with:

Location Name

Status: Checked in or not

Title (after check-in)

Optional: Photo upload or emoji badges

🧠 UX Best Practices Applied
Progressive Disclosure: Start simple, show more as users interact.

Micro-Interactions: Vibrate slightly on success, animate the check-in icon.

Gamification: Celebrate success, visually show progress.

Accessibility: Large tap targets, readable text.

Fail States:

Location Denied: Show explanation + CTA to enable.

Out of Range: "You're too far! Move closer to the point."

🔐 Technical Requirements
Area	Details
Platform	Flutter (iOS & Android)
GPS Accuracy	≤50 meters
API Call	GET /achievements?point_id={id}
Auth	Internal SSO (e.g., by Employee ID or Email)
Storage	Local progress saved with fallback (SQLite or SharedPrefs)
Timeout	API max wait 5 seconds
👥 User Roles
Role	Access
Employee	Check-in, view achievements
Admin (optional)	Manage location list, track completion (future scope)
📋 User Stories
✅ US001 – Check-In Flow
As an employee
I want to check in when I’m at a location
So that I can unlock a new achievement

Acceptance Criteria:

GPS must be enabled.

Must be within 50 meters of target.

Upon check-in, API is called and achievement is shown.

UI animates the success.

✅ US002 – View Achievements
As an employee
I want to view all check-in locations and my progress
So that I know which ones are left

Acceptance Criteria:

Visual indicator of 7 points.

Each checked-in location shows a unique title.

✅ US003 – See Progress Summary
As an employee
I want to see how many points I’ve checked in
So that I can complete all 7

Acceptance Criteria:

Show 0/7 → 7/7 clearly.

Optional: show mini confetti or badge when finished.

✅ US004 – Handle Location Errors
As a user
I want to be told if I’m out of range
So that I know what to do next

Acceptance Criteria:

Clear message when GPS is off.

Clear message when too far.

Retry button available.

✅ US005 – Permission Handling
As a user
I want to understand why the app needs my location
So that I can confidently allow it

Acceptance Criteria:

Permission request only appears once.

"We use your location to check you in at event points!" text.

