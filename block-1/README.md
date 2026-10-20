# Block 1: Local S3 Object Storage Engine

This module provisions an ultra-lightweight, high-performance local S3-compatible object storage cluster using **Garage** (written in Rust) backed by **SQLite**.

## Architecture & Port Mapping

| Port | Service | Description |
| :--- | :--- | :--- |
| `3900` | S3 API | Compatible endpoint for AWS SDKs, boto3, and standard S3 clients |
| `3901` | RPC | Internal cluster communication between Garage nodes |
| `3903` | Admin API | Management interface for node layout, keys, and bucket policies |

## Directory Layout
- `config/garage.toml`: Node configuration and storage engine declarations.
- `meta/`: Local SQLite metadata storage.
- `data/`: Raw encrypted object storage blocks.
- `start-lab.sh`: Automated bootstrap script for cluster layout and initial bucket provisioning.
