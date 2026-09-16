
````markdown
# Podcast Feed Generator

A GitHub Action that generates a podcast feed from a YAML file. YAML is much easier to read and write than XML, and this action converts your YAML file into a valid podcast feed.

## Usage

### 1. Enable GitHub Pages

In your repository:

1. Go to **Settings → Pages**.
2. Under **Build and deployment**, select the **main** branch as the source.
3. Save the settings.
4. GitHub will create a URL for your GitHub Pages site.

> **Note:** Save this URL because you will need it in the YAML configuration file.

---

### 2. Create a YAML File

Create a YAML file in your repository, for example:

```yaml
title: <Podcast Title>
subtitle: <Podcast Subtitle>
author: <Author Name>
description: <Podcast Description>
link: <GitHub Pages URL>
image: <Artwork Location>
language: <Podcast Language, e.g. en-us>
category: <Podcast Category, e.g. Technology>
format: <File Format, e.g. audio/mpeg>

item:
  - title: <Podcast Episode Title>
    description: <Podcast Episode Description>
    published: <Date Published, e.g. Thu, 12 Jan 2023 18:00:00 GMT>
    file: <Filename, e.g. /audio/TFIT01.mp3>
    duration: <Duration, e.g. 00:00:36>
    length: <File Size in Bytes, e.g. 576324>

  - title: <Another Episode Title>
    description: <Another Episode Description>
    published: <Date Published>
    file: <Filename>
    duration: <Duration>
    length: <File Size in Bytes>
````

For the list of supported Apple Podcasts categories, see the [Apple Podcasts Categories](https://podcasters.apple.com/support/1691-apple-podcasts-categories).

---

### 3. Create a GitHub Actions Workflow

Create a workflow file at:

```text
.github/workflows/generate-feed.yml
```

Add the following:

```yaml
name: Generate Feed

on:
  push:

jobs:
  generate-feed:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v3

      - name: Run Feed Generator
        uses: planetoftheweb/podcast-feed-generator@main
```

The workflow will run whenever you push changes to the repository and generate the podcast feed automatically.

---

## YAML Configuration

| Field         | Description                             |
| ------------- | --------------------------------------- |
| `title`       | Podcast title                           |
| `subtitle`    | Podcast subtitle                        |
| `author`      | Name of the podcast author              |
| `description` | Description of the podcast              |
| `link`        | GitHub Pages URL                        |
| `image`       | Location of the podcast artwork         |
| `language`    | Podcast language, e.g. `en-us`          |
| `category`    | Podcast category                        |
| `format`      | Audio file MIME type, e.g. `audio/mpeg` |
| `item`        | List of podcast episodes                |
| `published`   | Episode publication date                |
| `file`        | Path to the episode audio file          |
| `duration`    | Episode duration                        |
| `length`      | Audio file size in bytes                |

## Example Project Structure

```text
.
├── .github/
│   └── workflows/
│       └── generate-feed.yml
├── audio/
│   ├── episode1.mp3
│   └── episode2.mp3
├── podcast.yml
└── README.md
```

## How It Works

```text
YAML Podcast Configuration
          ↓
   GitHub Actions
          ↓
 Podcast Feed Generator
          ↓
      RSS Feed
          ↓
     GitHub Pages
```

The YAML file contains the podcast and episode information. The GitHub Action converts this information into a valid podcast RSS feed, which can then be hosted using GitHub Pages.

```

One small correction from your original: **“Postcast Category” → “Podcast Category”** and `length` is best described as the **file size in bytes**, rather than just “length.”
```
