Monocle
=======

_An elegant solution to manage images_

![Monocle](doc/images/monocle-mustache.gif)

## The problem

Dealing with images is a common requirement when putting a website together.

The _classic_ way to deal with large images is to create series of resized
images, and use the closest image in size on the frontend.

```html
 <img src='http://images.crowdtap.com/complicated_path/monocle-original.png'/>
 <img src='http://images.crowdtap.com/complicated_path/monocle-large.png'/>
 <img src='http://images.crowdtap.com/complicated_path/monocle-medium.png'/>
 <img src='http://images.crowdtap.com/complicated_path/monocle-small.png'/>
```

results in this:

![Monocle Original](doc/images/monocle-original.png)
![Monocle Big](doc/images/monocle-large.png)
![Monocle Medium](doc/images/monocle-medium.png)
![Monocle Small](doc/images/monocle-small.png)

If the image place holder is too big for your resized image, you will end up
with a **pixelated** image, on the other end if it is too small, you will
**lose bandwidth**, and your loadtime will be impacted. This classic approach
is sub-optimal.

## Our solution

We think we have a better way to deal with images using _**live transformation and caching**_.

Instead of using the resized images as a source for the images, we point to the
monocle service and pass parameters to it, the URL of the image being one of
them.

```html
 <img src='http://monocle.crowdtap.com/transform_image?src=http://images.crowdtap.com/images/monocle-original.png'/>
 <img src='http://monocle.crowdtap.com/transform_image?src=http://images.crowdtap.com/images/monocle-original.png&resize=100x100&greyscale=true'/>
```

# Try it!

`http://magickly.jux.com/?src=https://github.com/crowdtap/monocle/raw/master/doc/images/monocle-man.jpg&resize=250&flop=true`

![Monocle Small](http://magickly.jux.com/?src=https://github.com/crowdtap/monocle/raw/master/doc/images/monocle-man.jpg&resize=250&flop=true)




