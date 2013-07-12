Monocle
=======

![Monocle](doc/images/monocle-mustache.gif)

Many images, one lens

## The problem

Dealing with images is a common requirement when putting a website together.

The _classic_ way to deal with large images is to create series of resized
images, and use the closest image in size on the frontend.

```
   <img src='/images/monocle-original.png/>
   <img src='/images/monocle-large.png/>
   <img src='/images/monocle-medium.png/>
   <img src='/images/monocle-small.png/>
```

results in this:

![Monocle Original](doc/images/monocle-original.png)
![Monocle Big](doc/images/monocle-large.png)
![Monocle Medium](doc/images/monocle-medium.png)
![Monocle Small](doc/images/monocle-small.png)

If the image place holder is too big for your resized image, you will end up with a **pixelated** image, on the other end if it is too small, you will **loose bandwidth**, and your loadtime will be impacted. This classic approach is sub-optimal.

## Our solution

We think we have a better way to deal with images using _**live transformation and caching**_.
