# İlerleme Kaydı

## Gün 2 — 2026-10-25 (Faz 1, Hafta 1)
**Yapıldı:** SQLcl 26.3 kuruldu (`C:\tools\sqlcl`, PATH'e eklendi). `system` ile FREEPDB1'e bağlanıp `SELECT SYSDATE FROM DUAL` çalıştırıldı. `db/setup.sql` yazıldı: `ACCEPT ... HIDE` ile şifre alınıyor, `SET VERIFY OFF`, `CREATE USER mizan`, 6 sistem yetkisi, `USERS` kotası. `mizan` ile bağlanıldı, `SESSION_PRIVS` 6 yetkiyi gösteriyor. Gün 1'den devreden `.env.example` düzeltmesi commit edildi.
**Commit:** `chore: fix typo in env example`, `chore: add oracle app user setup script`
**Takıldığı yer:** SQLcl Türkçe locale yüzünden açılmadı (`optimized` → `optımızed`, Türkçe I problemi); `JAVA_TOOL_OPTIONS=-Duser.language=en -Duser.country=US` kullanıcı ortam değişkeni olarak eklendi. Script ilk önce SSMS'te yazılmaya çalışıldı. Şifre değişkeni `&` ve tırnaksız yazılmıştı; `old:/new:` çıktısı şifreyi açığa çıkardı → `SET VERIFY OFF`. `sql` komutu SQLcl içinde denendi (içeride `CONNECT` kullanılır).
**Oracle kontrol listesi:** A1 ✔
**Sıradaki:** Gün 3 — [V] Docker Compose; `docker-compose.yml` (Oracle, port, volume, healthcheck), şifre `.env`'den.
**Not:** Kullanıcı CDB/PDB, şema = kullanıcı, least privilege, image/container farkını gördü. Volume kavramı Gün 3'te açıklanacak (konteyner silinince verinin gittiği görüldü). Terminali proje kökünden açma alışkanlığı henüz yok. `mizan` şifresi şu an zayıf, yerel ortam için kabul edildi. İsteğe bağlı `UNDEFINE` eklenmedi.

## Gün 1 — 2026-10-24 (Faz 1, Hafta 1)
**Yapıldı:** GitHub deposu (`cetin-ckaya/mizan-ledger`) açıldı. `.gitignore`, `README.md`, `.env.example`, MIT `LICENSE` eklendi. `gvenzl/oracle-free` konteyneri (`mizan-oracle`, port 1521) "DATABASE IS READY TO USE!" durumunda.
**Commit:** `chore: initialize repository with gitignore and project docs`, `chore: add MIT license`
**Takıldığı yer:** Video Oracle'ın resmi imajını (`container-registry.oracle.com`) gösteriyordu; o imaj login istiyor ve şifreyi `ORACLE_PWD`'den okuyor, `ORACLE_PASSWORD` sessizce yok sayıldı. `gvenzl/oracle-free`'ye geçildi. `.gitignore`'u asistan yazdı (kullanıcı istedi, satır satır açıklandı).
**Oracle kontrol listesi:** —
**Sıradaki:** Gün 2 — SQLcl kurulumu, terminalden bağlantı, uygulama kullanıcısı, `db/setup.sql`. **[Oracle A1]**
**Devreden:** `.env.example` yazım düzeltmesi (`passowrd` → `password`) diskte yapıldı ama commit edilmedi; Gün 2 commit'ine girecek.
**Not:** Şifre şu an `docker run` komutunda; Gün 3'te `.env`'e taşınacak. JDK 21 Gün 4'ten önce kurulmalı (makinede şu an Java 25 var). İmaj sürümü 23.26 (Oracle "26ai" adını kullanıyor).
