# chrisgarrett/ruby-dev

* Ruby development image

## Versions / packages
* ruby 2.1

## Usage

### Standalone app:

```
docker run --rm \
      -v `pwd`/src:/work/app \
      chrisgarrett/ruby-dev:2.1 \
      make up
```

