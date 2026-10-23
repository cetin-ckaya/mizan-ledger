# İlerleme Kaydı

## Gün 1 — 2026-10-24 (Faz 1, Hafta 1)
**Yapıldı:** GitHub deposu (`cetin-ckaya/mizan-ledger`) açıldı. `.gitignore`, `README.md`, `.env.example`, MIT `LICENSE` eklendi. `gvenzl/oracle-free` konteyneri (`mizan-oracle`, port 1521) "DATABASE IS READY TO USE!" durumunda.
**Commit:** `chore: initialize repository with gitignore and project docs`, `chore: add MIT license`
**Takıldığı yer:** Video Oracle'ın resmi imajını (`container-registry.oracle.com`) gösteriyordu; o imaj login istiyor ve şifreyi `ORACLE_PWD`'den okuyor, `ORACLE_PASSWORD` sessizce yok sayıldı. `gvenzl/oracle-free`'ye geçildi. `.gitignore`'u asistan yazdı (kullanıcı istedi, satır satır açıklandı).
**Oracle kontrol listesi:** —
**Sıradaki:** Gün 2 — SQLcl kurulumu, terminalden bağlantı, uygulama kullanıcısı, `db/setup.sql`. **[Oracle A1]**
**Not:** Şifre şu an `docker run` komutunda; Gün 3'te `.env`'e taşınacak. JDK 21 Gün 4'ten önce kurulmalı (makinede şu an Java 25 var). İmaj sürümü 23.26 (Oracle "26ai" adını kullanıyor).
