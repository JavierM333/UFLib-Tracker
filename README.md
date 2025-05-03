# UFLib Tracker

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

UFLib Tracker is intended to help UF students keep track of everything libraries. Real-time updates on library occupancy, Library closure, filter on occupancy, notifications on when occupancy drops below threshold.

### App Evaluation

- **Category:** Utility
- **Mobile:** Real-time notifications and customization on everything libraries.
- **Story:** Keep track of how libraries are throughout the day
- **Market:** Intended for UF students, by UF students
- **Habit:** Strictly utility, not habit forming
- **Scope:** Only used within UF premise since only the libraries on campus will be tracked.

## Product Spec

### 1. User Stories

**Required Must-have Stories**

- As a user I want something that let's me know when the library is busy, saving me time by going to less busy libraries
- As a user, I want notifications on when the library occupancy drops below a certain threshold
- As a user, I want to be able to sort all the libraries by occupancy
### 2. Screen Archetypes

1. Login/Signup screen
2. Library List/Home Screen
* shows current occupancy and closures
3. Library Detail Screen
* Detailed occupancy and hours of selected library
4. Settings Screen
* Adjust notification preferences, occupancy thresholds, and favorite libraries.

### 3. Navigation

* **Home Tab**: Library list/Home screen
* **Favorites Tab**: Access to favorite libraries
* **Settings Tab**: User setting screen

**Flow Navigation** (Screen to Screen)

##### Login Screen

→ Home Screen upon successful login.

##### Home Screen

→ Library Detail Screen on selecting a library.

##### Library Detail Screen

→ Back to Home Screen.

##### Settings Screen

→ Back to Home Screen.

## Wireframes ##
<img width="495" alt="image" src="https://github.com/user-attachments/assets/55598941-6c63-4a4c-87f9-99cb1fe64f27" />


## Schema
![E381EEDE-B1BC-4734-9B0B-C28E0D34C8BA Small](https://github.com/user-attachments/assets/c51b4002-1cf3-4c99-8d53-85a3147a859c)



### Models
![Settings Small](https://github.com/user-attachments/assets/018baba8-be52-4f20-a6c3-5c7a6ab29a00)
![Notification popup Small](https://github.com/user-attachments/assets/3d091bc2-a38e-4507-aaf2-639800393df6)

### Networking

- UF library occupancy (called every 10 min) API call 
GET https://libcal.uflib.ufl.edu/1.1/spaces/status?api_key=MY_KEY  
- UF Libraries hours (called daily) API CALL
https://api3.libcal.com/api_hours_today.php?iid=YOUR_IID&lid[]=LID1&lid[]=LID2&format=json


### Main Features
* Home Screen: List of libraries with occupancy bars
* Library Detail Screen: Pie chart, today's hours, notification bell
* Settings Screen: Theme toggle, sorting preferences, library filter
* Notification Modal: Set occupancy thresholds and alerts
* Data Fetching: API integration for occupancy and hours
* Caching: To avoid API rate limits
* App Theme: Light/Dark/Auto support
* (Optional) Favorites tab

#### Sprint 1: Project Setup + API Prototypes
  Set up project repo and dev environment
  
  Test calling LibCal APIs from local script
  
  Create GET /occupancy and /hours backend mock (local or serverless)

#### Sprint 2: Home Screen + API Integration
  Build Home screen UI with mock data
  
  Integrate backend endpoints (real API → S3/dummy JSON)
  
  Poll every 10 mins for new data

##### Sprint 3: Library Detail + Notification Popup
  Add Library Detail UI: pie chart + today's hours
  
  Add notification bell and modal popup

#### Sprint 4: Settings + Theme Toggle
  Build settings page
  
  Implement theme switching (light, dark, auto)
  
  Sorting toggle, library order controls

#### Sprint 5: Polish + Favorites + Testing
  Implement Favorites tab
  
  Finalize navigation
  
  Bug fixes + styling cleanup

### Goals

* Set up GitHub repo and environment
* Make successful API calls for occupancy and hours
* Achievable using only fetch or Axios + mock endpoints
* Relevant for backend data integration
* Time-bound to complete in Week 1




