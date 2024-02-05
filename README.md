# App Name

Music Labs

## Overview

The application and its main functionalities.

## Features

### 1. User Authentication

-   Users can register and log in securely.

### 2. Song Listing

-   Display a list of songs from the database.

### 3. Music Player

-   Users can play/pause songs.
-   Users can select the next/previous song.
-   Continuous play: The next song automatically starts playing after the current one finishes.
-   No song plays more than once in a row?
-   Rand play songs implemented by api.
-   Random play: Users can play a random song without repetition of the songs.
-   Random play: Users can play a random song without repetition of an artists.

## Technologies Used

-   Laravel 10.42.0
-   Bootstrap
-   JavaScript
    -   Browser compatibility issues might arise.
    -   Pausing and resuming playback won't be as seamless as with JavaScript.
    -   Consider using a JavaScript audio player library for a better user experience and broader browser compatibility.
-   PHP 8.2.12
-   MySQL 15.1
-   ...

## Setup

-   Install Docker
-   Change the .env file based on credentials used
-   See Makefile as reference in root directory of the project
-   Steps to run the program, in terminal:
    -   Run "make build"
    -   Run "make up"
    -   Run "make migrate"
    -   Run "make seed"
    -   Run "make serve"
-   Go to Browser, type the link "http://localhost:8000/login"
    -   click register - input necessary fields
    -   example: email: bhen@yahoo.com, password: 123456

## Design Decisions

### 1. User Interface

-   Bootstrap is used for a clean and responsive UI.

### 2. Music Player

-   HTML5 audio element is utilized for playing audio.
-   JavaScript fetch API is used for interacting with the server.

### 3. Continuous Play

-   The 'ended' event of the audio player is leveraged for continuous play.

### 4. Random Play

-   The 'Random Play' button selects songs randomly, avoiding repetition.

## Usage

-   Choose song to play, and click the button play
-   Next, Previous, Pause, Random options can be use as well.

## Author

-   Arnel K Benedicto
-   Sr. Software Engineer | Sr. API Developer | Sr. Backend Developer
-   +639289989188 (WhatsApp | Viber | SMS)
-   arnelbenedicto@yahoo.com
