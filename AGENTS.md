# Repository Guidelines

# Project

This is an iOS SwiftUI app that shows the current weather and gives
personalized, inspirational suggestions on how to spend the day
based on the forecast (e.g. rainy day → cozy coffee shop + reading vibe).

Later the app may integrate with Calendar and other personal data sources. Also later the app may show cozy animations of a character doing activities according to the current weather.

## Project Structure & Module Organization

- App code lives under: `WeatherApp/`
  - `Views/`  
    - SwiftUI views and view hierarchies.
    - Only presentation logic (layouts, styles, small formatting helpers).
  - `ViewModels/`  
    - `ObservableObject` view models used by views.
    - Handle state, map models into UI-ready data, call services.
  - `Services/`  
    - Service protocols (e.g. weather loading, location, suggestions).
    - Concrete implementations (mock / real / stub).
  - `Models/`  
    - Data and domain models: weather snapshots, conditions, palettes, vibes, rhythm blocks, hour blocks, activity ideas, etc.
    - Prefer simple value types (`struct` / `enum`) that are easy to test.
  - `Mocks/`  
    - Mock data and helpers for previews and tests (e.g. mock weather snapshots).
  - `Coordinators/`  
    - App-level coordinator(s) responsible for composition and navigation.
  - App entry: `WeatherAppApp.swift` (or equivalent) under `WeatherApp/`.
  - Assets: `Assets.xcassets/` for colors, images, etc.
- Tests:
  - `WeatherAppTests/` — unit tests.
  - `WeatherAppUITests/` — UI tests.

Concrete file names can evolve over time. The important rule: **models go into `Models/`, view models into `ViewModels/`, services into `Services/`, coordinators into `Coordinators/`, etc.**

## Build, Test, and Development Commands

- Open in Xcode: double-click `WeatherApp.xcodeproj` and run the `WeatherApp` scheme.
- CLI build (iOS Simulator example):  
  `xcodebuild -scheme WeatherApp -destination 'platform=iOS Simulator,name=iPhone 16' build`
- Unit/UI tests:  
  `xcodebuild -scheme WeatherApp -destination 'platform=iOS Simulator,name=iPhone 16' test`
- SwiftUI previews: use Xcode canvas; ensure mock data in `Mocks/` is available.

## Coding Style & Naming Conventions

- Language: Swift 5; prefer `struct` for value models, `enum` for finite states, `class` only where reference semantics/`ObservableObject` are needed.
- Indentation: 4 spaces; group related modifiers; keep body expressions short and readable.
- Names: CamelCase for types/members; protocols often suffixed with `Protocol`; mocks prefixed with `Mock` or added via extensions like `+Mocks`.
- SwiftUI: keep view logic lean; push data shaping into ViewModel/Service layers.
- Comments and documentation: **English**.
- Default user-facing UI texts: **Ukrainian**, unless explicitly stated otherwise.

## Testing Guidelines

- Framework: XCTest (unit/UI). Place unit tests in `WeatherAppTests`, UI flows in `WeatherAppUITests`.
- Naming: `test_<Scenario>_<Expectation>()`.
- Prefer injecting `WeatherServiceProtocol` mocks into `WeatherViewModel` for deterministic tests; avoid hitting network.
- Aim for fast, isolated tests; keep fixtures in `Mocks/` or local helpers.

## Architecture Overview

- Pattern: **MVVM + Coordinator**.
- `AppCoordinator`:
  - owns the root composition and navigation (e.g. which initial view to show),
  - wires together `WeatherViewModel`, `WeatherServiceProtocol`, and views,
  - does **not** contain business logic, only navigation / composition / screen flows.
- `WeatherViewModel`:
  - is an `ObservableObject` that exposes `@Published` state for the views,
  - talks to `WeatherServiceProtocol` (or similar) to obtain weather data,
  - transforms raw models (`WeatherSnapshot`, `Condition`, etc.) into UI-ready concepts (`Vibe`, `ActivityIdea`, etc.),
  - handles user actions from the view (refresh, change day/hour, toggle modes).
- Views:
  - stay declarative and bind to `WeatherViewModel` state,
  - contain only lightweight presentation/formatting logic (layout, conditional styles, small helpers),
  - do not call services directly.
- Services:
  - live in `Services/` and are accessed via protocols (e.g. `WeatherServiceProtocol`),
  - hide data-fetching details (mock vs real API / WeatherKit),
  - can later be split into “Data” and “Domain” layers if the app grows, without changing Views.
- Data flow:  
  **Service → ViewModel → View**,  
  UI actions → **View → ViewModel → Service/Coordinator**.  
  You should be able to replace `MockWeatherService` with a real implementation without touching views.

## Localization / UI Texts

- Default user-facing language: **Ukrainian**.
- Keep texts short, friendly and supportive (no toxic or negative tone).
- When adding new strings, prefer meaningful, human-sounding phrases that fit on a phone screen.

## Testing & Safety

- When you change non-trivial logic, add or update at least basic unit tests.
- The app must compile and run after your changes.
- Prefer incremental changes that are easy to review over giant diffs.

## AI Assistant / Codex Usage

- Codex / AI assistants should treat this document as the single source of truth for project structure and architecture.
- They may:
  - create and modify Swift files only inside the `WeatherApp/` target and test targets,
  - add new Views, ViewModels, Models, and Services that respect the existing folder and naming structure,
  - extend `AppCoordinator` with new routes and navigation helpers (without moving business logic into it),
  - add unit tests in `WeatherAppTests/` for non-trivial logic (ViewModels, Services, helpers),
  - keep user-facing strings in Ukrainian by default and comments in English.
- They must NOT (without explicit request):
  - change signing settings, schemes, bundle identifiers, or Xcode project structure,
  - add external dependencies or SPM packages,
  - perform large cross-cutting refactors that touch many unrelated files,
  - change the overall MVVM + Coordinator structure or move business logic into views or coordinators.
- Prefer small, incremental, compiling changes that keep tests passing.
- When in doubt, suggest 1–2 options and briefly explain trade-offs before applying big changes.

## When in doubt

- Prefer asking for clarification instead of guessing.
- Suggest 1–2 options (e.g. different UI/architecture approaches) and explain trade-offs briefly.
