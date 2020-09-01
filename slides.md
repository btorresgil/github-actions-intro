# GitHub Actions

Presented by  
Brian Torres-Gil

---

## Terminology

- Workflow
- Trigger
- Job
- Step
- Action

---

## Example workflow

Workflow - Trigger - Job - Step - Action

```yaml [|3|6-12|7|8-12|9-10]
name: 'Test my python project'

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@2
      - run: pip install pytest
      - run: pytest
```

---

## Scope

- A **Job** is an environment
- **Steps** run in the same environment

```yaml [6-12|13-19]
name: 'Test my python project'

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@2
      - run: pip install pytest
      - run: pytest
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@2
      - run: pip install flake8
      - run: flake8
```

---

## Actions Marketplace

<img data-src="/images/actions-marketplace-terraform.png" />

---

## Test multiple versions

<div class="r-stack">

```yaml []
name: 'Test my python project'
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@2
      - run: pip install pytest
      - run: pytest
```

<!-- .element class="fragment fade-out" data-fragment-index="0" -->

```yaml [|7-9,13-14]
name: 'Test my python project'
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: [2.7, 3.5, 3.6, 3.7, 3.8]
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@2
        with:
          python-version: ${{ matrix.python-version }}
      - run: pip install pytest
      - run: pytest
```

<!-- .element class="fragment" data-fragment-index="0" -->

</div> <!-- end of r-stack -->

---

## Test multiple OS's

<div class="r-stack">

```yaml []
name: 'Test my python project'
on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: [2.7, 3.5, 3.6, 3.7, 3.8]
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@2
        with:
          python-version: ${{ matrix.python-version }}
      - run: pip install pytest
      - run: pytest
```

<!-- .element class="fragment fade-out" data-fragment-index="0" -->

```yaml [|6,9]
name: 'Test my python project'
on: [push, pull_request]

jobs:
  test:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest, macos-latest, windows-latest]
        python-version: [2.7, 3.5, 3.6, 3.7, 3.8]
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@2
        with:
          python-version: ${{ matrix.python-version }}
      - run: pip install pytest
      - run: pytest
```

<!-- .element class="fragment" data-fragment-index="0" -->

</div> <!-- end of r-stack -->

---

## Triggers

```yaml [|2-7]
name: 'Test my python project'
on:
  pull_request:
  push:
    branches:
      - master
      - develop

jobs:
  test:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: [2.7, 3.5, 3.6, 3.7, 3.8]
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-python@2
        with:
          python-version: ${{ matrix.python-version }}
      - run: pip install pytest
      - run: pytest
```

---

# ⚙️🛠

**Let's try it out!**
