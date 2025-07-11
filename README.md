![ChatGPT Image Jul 5, 2025 at 06_07_31 PM](https://github.com/user-attachments/assets/2660f828-49c7-444d-beca-d8b01854667a)
# MeshTalk

> [!WARNING]
> Private message and channel features have not received external security review and may contain vulnerabilities. Do not use for sensitive use cases, and do not rely on its security until it has been reviewed. Work in progress. Public local chat (the main feature) has no security concerns. 

A decentralized peer-to-peer messaging app that works over Bluetooth mesh networks. No internet required, no servers, no phone numbers. It's the side-groupchat. 

## Author

**Philodi**  
Email: me@philodi.com  
Website: https://philodi.com

## License

This project is released into the public domain. See the [LICENSE](LICENSE) file for details.

## Features

- **Decentralized Mesh Network**: Automatic peer discovery and multi-hop message relay over Bluetooth LE
- **End-to-End Encryption**: X25519 key exchange + AES-256-GCM for private messages and channels
- **Channel-Based Chats**: Topic-based group messaging with optional password protection
- **Store & Forward**: Messages cached for offline peers and delivered when they reconnect
- **Privacy First**: No accounts, no phone numbers, no persistent identifiers
- **IRC-Style Commands**: Familiar `/join`, `/msg`, `/who` style interface
- **Message Retention**: Optional channel-wide message saving controlled by channel owners
- **Universal App**: Native support for iOS and macOS
- **Cover Traffic**: Timing obfuscation and dummy messages for enhanced privacy
- **Emergency Wipe**: Triple-tap to instantly clear all data
- **Performance Optimizations**: LZ4 message compression, adaptive battery modes, and optimized networking

## Setup

### Option 1: Using XcodeGen (Recommended)

1. Install XcodeGen if you haven't already:
   ```bash
   brew install xcodegen
   ```

2. Generate the Xcode project:
   ```bash
   cd MeshTalk
   xcodegen generate
   ```

3. Open the generated project:
   ```bash
   open MeshTalk.xcodeproj
   ```

### Option 2: Using Swift Package Manager

1. Open the project in Xcode:
   ```bash
   cd MeshTalk
   open Package.swift
   ```

2. Select your target device and run

### Option 3: Manual Xcode Project

1. Open Xcode and create a new iOS/macOS App
2. Copy all Swift files from the `MeshTalk` directory into your project
3. Update Info.plist with Bluetooth permissions
4. Set deployment target to iOS 16.0 / macOS 13.0

## Usage

### Basic Commands

- `/j #channel` - Join or create a channel
- `/m @name message` - Send a private message
- `/w` - List online users
- `/channels` - Show all discovered channels
- `/block @name` - Block a peer from messaging you
- `/block` - List all blocked peers
- `/unblock @name` - Unblock a peer
- `/clear` - Clear chat messages
- `/pass [password]` - Set/change channel password (owner only)
- `/transfer @name` - Transfer channel ownership
- `/save` - Toggle message retention for channel (owner only)

### Getting Started

1. Launch MeshTalk on your device
2. Set your nickname (or use the auto-generated one)
3. You'll automatically connect to nearby peers
4. Join a channel with `/j #general` or start chatting in public
5. Messages relay through the mesh network to reach distant peers

### Channel Features

- **Password Protection**: Channel owners can set passwords with `/pass`
- **Message Retention**: Owners can enable mandatory message saving with `/save`
- **@ Mentions**: Use `@nickname` to mention users (with autocomplete)
- **Ownership Transfer**: Pass control to trusted users with `/transfer`

## Security & Privacy

### Encryption
- **Private Messages**: X25519 key exchange + AES-256-GCM encryption
- **Channel Messages**: Argon2id password derivation + AES-256-GCM
- **Digital Signatures**: Ed25519 for message authenticity
- **Forward Secrecy**: New key pairs generated each session

### Privacy Features
- **No Registration**: No accounts, emails, or phone numbers required
- **Ephemeral by Default**: Messages exist only in device memory
- **Cover Traffic**: Random delays and dummy messages prevent traffic analysis
- **Emergency Wipe**: Triple-tap logo to instantly clear all data
- **Local-First**: Works completely offline, no servers involved

## Performance & Efficiency

### Message Compression
- **LZ4 Compression**: Automatic compression for messages >100 bytes
- **30-70% bandwidth savings** on typical text messages
- **Smart compression**: Skips already-compressed data

### Battery Optimization
- **Adaptive Power Modes**: Automatically adjusts based on battery level
  - Performance mode: Full features when charging or >60% battery
  - Balanced mode: Default operation (30-60% battery)
  - Power saver: Reduced scanning when <30% battery
  - Ultra-low power: Emergency mode when <10% battery
- **Background efficiency**: Automatic power saving when app backgrounded
- **Configurable scanning**: Duty cycle adapts to battery state

### Network Efficiency
- **Optimized Bloom filters**: Faster duplicate detection with less memory
- **Message aggregation**: Batches small messages to reduce transmissions
- **Adaptive connection limits**: Adjusts peer connections based on power mode

## Technical Architecture

### Binary Protocol
MeshTalk uses an efficient binary protocol optimized for Bluetooth LE:
- Compact packet format with 1-byte type field
- TTL-based message routing (max 7 hops)
- Automatic fragmentation for large messages
- Message deduplication via unique IDs

### Mesh Networking
- Each device acts as both client and peripheral
- Automatic peer discovery and connection management
- Store-and-forward for offline message delivery
- Adaptive duty cycling for battery optimization

For detailed protocol documentation, see the [Technical Whitepaper](WHITEPAPER.md).

## Building for Production

1. Set your development team in project settings
2. Configure code signing
3. Archive and distribute through App Store or TestFlight

## Android Compatibility

The protocol is designed to be platform-agnostic. An Android client can be built using:
- Bluetooth LE APIs
- Same packet structure and encryption
- Compatible service/characteristic UUIDs

## MacOS

Want to try this on macos: `just run` will set it up and run from source. 
Run `just clean` afterwards to restore things to original state for mobile app building and development.

## Customization Ideas

### UI/UX Enhancements
- **Dark/Light Theme Toggle**: Add theme switching capability with custom color schemes
- **Custom Chat Bubbles**: Implement different bubble styles and message layouts
- **Animated Transitions**: Add smooth animations for message sending/receiving
- **Custom Fonts**: Allow users to choose from different font families
- **Message Timestamps**: Add configurable timestamp display options
- **Typing Indicators**: Show when other users are typing

### Feature Extensions
- **File Sharing**: Support for sharing images, documents, and other files
- **Voice Messages**: Add voice recording and playback capabilities
- **Message Reactions**: Emoji reactions to messages
- **Message Threading**: Reply to specific messages with threading
- **Message Search**: Search through chat history
- **Message Forwarding**: Forward messages to other channels
- **Custom Emojis**: Add support for custom emoji packs
- **Message Scheduling**: Schedule messages to be sent later

### Privacy & Security
- **Message Expiration**: Set messages to auto-delete after a time period
- **Screenshot Detection**: Warn users when screenshots are taken
- **Biometric Lock**: Add fingerprint/Face ID protection
- **Stealth Mode**: Hide app icon and notifications
- **Message Encryption Levels**: Different encryption options for different security needs

### Network & Performance
- **Wi-Fi Direct Support**: Extend beyond Bluetooth to Wi-Fi Direct
- **Internet Bridge**: Optional internet connectivity for wider reach
- **Message Priority**: High-priority message delivery
- **Offline Mode**: Enhanced offline functionality
- **Network Statistics**: Show connection quality and network health

## Roadmap

### Phase 1: Core Enhancements (Q1 2024)
- [ ] Implement dark/light theme toggle
- [ ] Add message timestamps and typing indicators
- [ ] Improve UI with custom chat bubbles
- [ ] Add message search functionality
- [ ] Implement file sharing for images

### Phase 2: Advanced Features (Q2 2024)
- [ ] Voice message support
- [ ] Message reactions with emojis
- [ ] Message threading and replies
- [ ] Message expiration settings
- [ ] Biometric authentication

### Phase 3: Network Expansion (Q3 2024)
- [ ] Wi-Fi Direct integration
- [ ] Internet bridge for extended reach
- [ ] Enhanced offline mode
- [ ] Network statistics dashboard
- [ ] Message priority system

### Phase 4: Privacy & Security (Q4 2024)
- [ ] Screenshot detection
- [ ] Stealth mode implementation
- [ ] Advanced encryption options
- [ ] Message forwarding capabilities
- [ ] Custom emoji support

### Phase 5: Platform Expansion (2025)
- [ ] Android client development
- [ ] Web client for desktop browsers
- [ ] API for third-party integrations
- [ ] Plugin system for custom features
- [ ] Cross-platform sync capabilities
