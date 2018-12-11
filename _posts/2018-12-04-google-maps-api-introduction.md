---
published: true
title: Goolge Maps API 使用介紹
categories:
  - google
layout: post
date: '2018-12-04 17:53:00+0800'
date_modified: '2018-12-04 17:53:00+0800'
---

### Google Maps API 包含下列幾個元素：
- div 標籤，並且宣告 id 。
- Google Maps API Javascript 以及 API Key
- Callback Function


**1. div 標籤，並且宣告 id**

```
<!-- div id 'map' --> 
<div id="map"></div>
```

**2. 加載 Google Maps API Javascript**

```
<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&callback=initMap" async defer></script>
```

**3. 宣告 Callback Function**

```
function initMap(){
    var map=new google.maps.Map(document.getElementById('map'), {
      zoom: 16,
      //center: {lat: -33.890, lng: 151.274}
      draggable: false,
      zoomControl: false,
      mapTypeControl: false,
      scaleControl: false,
      streetViewControl: false,
      rotateControl: false,
      fullscreenControl: false
    });
    map.setCenter({lat: -33.890, lng: 151.274});
    ...
}
```
