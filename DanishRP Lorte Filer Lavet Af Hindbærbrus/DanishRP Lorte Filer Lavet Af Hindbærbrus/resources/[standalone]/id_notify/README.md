# skeexsNotify - Reworked by cBeyer (id_notify)
FiveM notification script for roleplay servers



<h1>Documentation</h1>

The first thing you need to do is to download the resource and start it in your server.cfg

<pre>ensure id_notify</pre>

<p> There are different types: <b style="color: lightgreen">"success" </b> | <b style="color: lightblue">"info" </b> | <b style="color: red"> "error"</b> | <b style="color: lightpink"> "message" </b> </p>

```lua
exports["id_notify"]:notify({
    title = 'Title',
    message = 'Custom message',
    type = 'success'
})
```

<p> Custom type, vælg et hvilket som helst icon fra de to links længere nede </p>

```lua
exports["id_notify"]:notify({
    title = 'Title',
    message = 'Custom message',
    type = 'custom',
    icon = 'fab fa-android'
})
```

If you want to edit the icons you can find the collection of icons at <br>
https://icons.getbootstrap.com/
https://fontawesome.com/v5/search?m=free

or if you want to change the icons you can do that in the JS file like this <br>

```js
  ["iconname"]: {
    ["icon"]: "bi bi-telephone-inbound",
  },
```
