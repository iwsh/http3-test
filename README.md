# NGINX で HTTP3 を使用する

NGINX 1.25 で HTTP/3 対応

OpenSSL では QUIC 対応していないため、NGINX には OpenSSL 互換レイヤを実装している (0-RTTは動かない)
https://www.nginx.com/blog/quic-http3-support-openssl-nginx/

OpenSSL 3.2 で QUIC のクライアントサイドのサポートされた。OpenSSL 3.3から3.4でサーバサイドのQUICの実装がさらに進められる予定https://www.infoq.com/news/2023/12/openssl-3-2-released/



https://http3-explained.haxx.se/en/

https://zenn.dev/kurayasu/articles/443024e98437cb

https://scrapbox.io/nwtgck/127.0.0.1%E3%81%ABLet'_Encrypt%E3%81%A7%E8%A8%BC%E6%98%8E%E6%9B%B8%E3%82%92%E7%99%BA%E8%A1%8C%E3%81%97%E3%81%A6https%E3%81%A7%E3%81%AE%E3%83%AD%E3%83%BC%E3%82%AB%E3%83%AB%E9%96%8B%E7%99%BA%E3%81%A8%E6%9C%AC%E7%95%AA%E3%81%AE%E5%B7%AE%E7%95%B0%E3%82%92%E4%BD%8E%E6%B8%9B%E3%81%99%E3%82%8B%E3%81%9F%E3%82%81%E3%81%AE%E5%85%B7%E4%BD%93%E7%9A%84%E3%81%AA%E6%89%8B%E9%A0%86

https://zenn.dev/catatsuy/articles/71609eff5611e4s

https://zenn.dev/novenove/articles/ffb61d96393495



docker run --network host -it --rm ymuski/curl-http3:8.2.1 bash\
