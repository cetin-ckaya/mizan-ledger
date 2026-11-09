# İlerleme Kaydı

## Gün 3 — 2026-11-09 (Faz 1, Hafta 1)
**Yapıldı:** `docker-compose.yml` yazıldı: `gvenzl/oracle-free`, `container_name: mizan-oracle`, port 1521, şifre `.env`'den (`${ORACLE_PASSWORD}`), named volume `oracle_data` → `/opt/oracle/oradata`, `healthcheck.sh` ile healthcheck. Eski `docker run` konteyneri silindi, compose ile kalktı (`healthy`). `db/setup.sql` ile `mizan` yeniden oluşturuldu. `docker compose down` + `up -d` sonrası `mizan` kullanıcısı duruyor; log'da "first database startup" yok → volume çalışıyor. Gün 2'den kalan mülakat notları commit'i atıldı.
**Commit:** `chore: add interview notes rule and keep notes out of repo`, `chore: add docker compose for oracle free`
**Takıldığı yer:** `retries: 5s` (sayı olmalı), `container-name` / `enviroment` yazım hataları, şifre önce dosyaya gömülü yazıldı, `environment` altında liste ve map biçimi karıştırıldı (`- password: ...`) ve anahtar adı `ORACLE_PASSWORD` yerine `password` yazıldı. Bağlantıda `FREEDB1` (→ `ORA-12514`) ve yer tutucu `< >` işaretleri bırakıldı.
**Oracle kontrol listesi:** —
**Sıradaki:** Gün 4 — Spring Initializr ile proje (group `com.<ad>`, artifact `mizan`; Web, JPA, Validation, Flyway, Oracle JDBC), Oracle bağlantı ayarları. Uygulama hatasız kalkmalı.
**Not:** JDK 21 Gün 4'te gerekli, henüz kurulmadı (makinede Java 25). Java paket adı için `<ad>` kararı verilecek. `.gitignore`'daki `oracle-data/` satırı named volume seçildiği için kullanılmıyor. Compose volume'u proje adıyla önekliyor: `mizan-ledger_oracle_data`. `docker compose down -v` volume'u siler, uyarıldı.

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
