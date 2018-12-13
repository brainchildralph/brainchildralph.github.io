---
layout: post
title: "CryptJS Notes"
description: "Description"
date: 2018-12-13 15:00:00+0800
date_modified: 2018-12-13 15:00:00+0800
categories: ["javascript","aes"]
tags:
  - "javascript"
  - "aes"
author: brainchildralph
image:
comments: true
passphrase: 
  enabled: true
  password: "ooxx"
  encrypted: "U2FsdGVkX1+lO64bWx9P2yWXy7yjynbF4/6gc/0/OIE="
  decrypted: "Passw0rd!"
#  type: "new"
---

```
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.js"></script>
<script>
var encrypted = CryptoJS.AES.encrypt("112233", "password");
var decrypted=CryptoJS.AES.decrypt(encrypted, "password").toString(CryptoJS.enc.Utf8)
console.log(encrypted.toString());
console.log(decrypted.toString());
</script>
```
<!--
<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.9-1/crypto-js.js"></script>
<script>
var encrypted = CryptoJS.AES.encrypt("112233", "ooxx");
var decrypted=CryptoJS.AES.decrypt(encrypted, "ooxx").toString(CryptoJS.enc.Utf8)
console.log(encrypted.toString());
console.log(decrypted.toString());
</script>
-->
