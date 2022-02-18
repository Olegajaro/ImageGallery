# ImageGallery

____

## Описание

Галерия с изображениями полученными из сети и сохраненными при помощи __CoreData__. При отсутствии сети показываются последние загруженные данные. 
Данные взяты из публичного API [jsonplaceholder](https://jsonplaceholder.typicode.com/photos).

![gallery](/Screenshots/Gallery.png) ![detail](/Screenshots/Detail.png)

____

## Используемые технологии

+ Swift 5.5 (iOS 15.2)
+ UIKit
+ Без использования storyboard
+ MVC
+ CollectionView
+ URLSession
+ CoreData
+ SDWebImage

____

## Особенности

Для получение изображения из сети и его кеширования использовался сторонний фреймворк SDWebImage. Интеграция его в проект реализована при помощи cocapods. Перед запуском проекта необходимо через терминал открыть директорию с проектом и прописать `pod install` в консоли. 
