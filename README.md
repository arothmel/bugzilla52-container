# Bugzilla 5.2 Containerized (AlmaLinux 8)

This is a working, containerized Bugzilla 5.2 environment built on AlmaLinux 8,
with all required Perl modules, Apache, and MariaDB included.

## Why

Because in 2025, Perl + Bugzilla + RHEL is *still a thing*... and no one should suffer alone.

## Highlights

- ✅ AlmaLinux 8 base image
- ✅ EPEL & PowerTools enabled
- ✅ Full Perl dependencies for Bugzilla 5.2
- ✅ 100% offline-ready container image export

## Download Bugzilla 5.2 Source

This container expects the Bugzilla 5.2 source files to be placed in `bugzilla-5.2/`.

You can download the original source from:

https://ftp.mozilla.org/pub/mozilla.org/webtools/bugzilla/bugzilla-5.2.tar.gz

```bash
wget https://ftp.mozilla.org/pub/mozilla.org/webtools/bugzilla/bugzilla-5.2.tar.gz
tar -xzf bugzilla-5.2.tar.gz
```

## Deployment Notes

If you're using the pre-built container image (`bugzilla52-alma8.tar`), you do **not** need to download the Bugzilla 5.2 source separately — it is already included in the image.

This project is designed to be built once on a system with internet access (e.g., Frodo) and deployed on a separate system where the Bugzilla SQL database is accessible.

**Important:** Do not copy the `bugs.sql` file or any production database dumps to Frodo or this GitHub repository.

Instead, keep your database files local to the new system and use Docker volumes or bind mounts to connect the Bugzilla container to your MariaDB data.

Example:
```bash
podman run -d -p 8080:80 \
  -v /home/tux/bugs.sql:/data/bugs.sql:ro \
  bugzilla52:alma8
```


