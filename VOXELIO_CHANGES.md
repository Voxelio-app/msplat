# Voxelio fork changes

This fork preserves the history and Apache-2.0 license of
[`rayanht/msplat`](https://github.com/rayanht/msplat).

The Voxelio iOS package is based on upstream commit
`106499b0a53f82b0c92d013b0861fbebd341b17e`. The repository reports version
`1.1.3`; that commit is newer than the `v1.1.3` tag.

## Source-only iOS package

- Adds a root `Package.swift` for iOS 18+.
- Builds the Swift, C++, Objective-C++, and Metal implementation from
  `Sources/`.
- Does not download or link a prebuilt msplat XCFramework, static library, or
  metallib.
- Keeps the C bridge public while the C++ headers remain implementation
  details of the Swift package.
- Vendors the header-only nlohmann/json `v3.11.3` and nanoflann `v1.5.5`
  dependencies with their license texts and source hashes.

## Behavioral changes

Voxelio carries the following changes in the iOS source package:

1. Packed tile writes are bounded when late-training intersection counts
   exceed the working-buffer capacity.
2. Chunked render buffers are reallocated when the requested image resolution
   changes.
3. Checkpoint saving reports success to Swift as `Bool`.
4. Checkpoint loading reports failure as `nil` instead of returning a negative
   iteration through the Swift API.

The upstream Python, CLI, CMake, and macOS XCFramework workflows remain in the
repository for provenance and upstream compatibility. The root Swift package
uses the source snapshot under `Sources/`.

## Vendored dependencies

- nlohmann/json `v3.11.3` — MIT
  - `json.hpp` SHA-256:
    `9bea4c8066ef4a1c206b2be5a36302f8926f7fdc6087af5d20b417d0cf103ea6`
- nanoflann `v1.5.5` — BSD-2-Clause
  - `nanoflann.hpp` SHA-256:
    `2d1ca5d59ace41f7f6e778d8dce6d7d79f51f7d22c67fae04ef29cf1ca71259a`

Their license texts are stored in `Sources/MsplatCore/vendor/licenses/`.

## License

The original project and Voxelio modifications remain licensed under
Apache-2.0. Copyright in Voxelio's modifications is held by Voxelio.
