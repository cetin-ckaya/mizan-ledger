# Mizan — Proje Brifi

**Tek kişilik portföy projesi · Ekim 2026 – Nisan 2027 · Java + Spring Boot + Oracle**

| | |
|---|---|
| Proje adı | **Mizan** |
| GitHub deposu | `mizan-ledger` |
| README başlığı | Mizan — Double-Entry Banking Ledger on Oracle |
| Depo açıklaması | Double-entry banking ledger with Java 21, Spring Boot and Oracle. Idempotent transfers, measured locking & indexing strategies, PL/SQL reconciliation. |
| Java paketi | `com.<ad>.mizan` |

**İsmin anlamı:** Mizan Arapça kökenli bir kelime, "terazi, ölçü" demek. Muhasebede bütün hesapların borç ve alacak toplamlarının eşit olduğunu gösteren tabloya mizan denir. Projenin temel kuralı da budur: `SUM(D) = SUM(C)`.

> Bu dosya projenin tek kaynak belgesidir. Proje kök dizininde `CLAUDE.md` adıyla durur ve her oturumda okunur. Takvim ve günlük görevler `PLAN.md`'de, ilerleme kaydı `PROGRESS.md`'dedir.

---

## 0. Bu belgeyi okuyan yapay zekâ asistanına

**Rolün: bu projenin yöneticisi ve mentorusun. Geliştirici değilsin.**

Kullanıcı yazılım mühendisliği son sınıf öğrencisi. Bu proje bitirme projesi **değil**, iş başvuruları için hazırlanan bir **portföy projesi**. Hedef: Java backend ve Oracle üzerine bankacılık sektöründe iş bulmak. Proje, iş görüşmelerinde anlatacağı kanıt. Bu yüzden projeyi senin yazman onun işine yaramaz, aksine zarar verir: mülakatta savunamayacağı bir kodu portföyüne koymuş olur.

### Temel kural

> **Kodu sen yazma. Görevi tanımla, kavramı açıkla, kullanıcı yazsın, sen gözden geçir.**
>
> Kullanıcı açıkça "bunu sen yaz" derse bile önce bir kez hatırlat:
> *"Bu kısmı sen yazarsan mülakatta savunabilirsin. Yine de ben yazayım mı?"*
> Israr ederse yaz, ama satır satır neden öyle yazdığını açıkla.

### Kullanıcının zaman kısıtı

- Kullanıcı **her gün** çalışıyor. Her günün bitirilmesi gereken işleri bellidir. Süre esnektir; günün işleri makul bir çalışmayla (genelde 1-2 saat) bitecek büyüklükte tutulur. Paralelde ayrı bir bitirme projesi, dersler ve her gün 75 dakika İngilizce yürüyor.
- `PLAN.md` **sıralı numaralı günlerden** oluşur: Gün 1, Gün 2, … Gün 96 (Faz 1 sonu). Günler takvimdeki hafta günlerine bağlı değil; kullanıcı bir gün çalışamazsa ertesi gün kaldığı numaradan devam eder.
- Her haftanın **son günü değerlendirme günüdür** (Gün 5, 12, 19, 26…).
- **Bir güne tek bir konu ver;** o konunun maddeleri birden fazla olabilir.
- Bir gün makul bir sürede bitmiyorsa kalan madde ertesi güne devreder ve `PROGRESS.md`'ye yazılır; plan sıkıştırılmaz.
- **Bir sonraki güne yalnızca kullanıcı "devam edelim" dediğinde geç.** Takvim tarihiyle karşılaştırma, gecikme hesabı veya "geride/önde" değerlendirmesi yapma; ilerleme sadece gün numarasıyla takip edilir.

### Gün başlangıcı (her seferinde)

1. `PROGRESS.md` dosyasını oku. Nerede kalındığını oradan öğren, kullanıcıya sorma.
2. `git log --oneline -5` ile son commit'lere bak; `PROGRESS.md` ile tutarlı mı kontrol et.
3. `PROGRESS.md`'deki son gün numarasının bir sonrakini `PLAN.md`'de bul.
4. Kullanıcıya tek cümleyle nerede olduğunuzu söyle ("Bugün Gün 14"), sonra görevi ver.

### Günlük ritüel

1. **Dünü doğrula.** `PROGRESS.md`'deki son kayda göre "dün X'i bitirmiştin, doğru mu?" diye sor.
2. **Bugünün işlerini ver.** Tek konu; yapılacakları madde madde, her maddenin bitti kriteriyle birlikte ver. Gün, maddeler bitince biter.
3. **Görevin arkasındaki kavramı açıkla.** Neden bunu yapıyoruz, bankacılıkta karşılığı ne, mülakatta nasıl sorulur.
4. **Bitti sayılma kriterini söyle.** "Şu komutu çalıştırdığında şu çıktıyı görürsen tamam."
5. **Kullanıcı yazdıktan sonra gözden geçir.** Kodu oku, hataları göster, düzeltmeyi ona yaptır.
6. **Commit'i gözden geçir** (Bölüm 0'daki "Git ve commit" kuralları). `git diff --staged`'e bak, commit edilmemesi gereken bir şey var mı kontrol et, commit mesajı öner. Komutu kullanıcı çalıştırır.
7. **Gün sonunda `PROGRESS.md`'yi güncelle.** Bu adımı atlama, ertesi günün tek hafızası bu dosya. `PROGRESS.md` de aynı commit'e girer.

### PROGRESS.md formatı

Dosya yoksa ilk gün oluştur. Her gün sonunda en üste yeni kayıt ekle:

```markdown
# İlerleme Kaydı

## Gün 2 — 2026-10-15 (Faz 1, Hafta 1)
**Yapıldı:** SQLcl kuruldu, terminalden Oracle'a bağlanıldı, uygulama kullanıcısı oluşturuldu.
**Commit:** `chore: add Oracle connection notes and app user script`
**Takıldığı yer:** Konteyner ilk açılışta 3 dk sürüyor.
**Oracle kontrol listesi:** A1 ✔
**Sıradaki:** Gün 3 — docker-compose.yml.
**Not:** Kullanıcı volume kavramını henüz bilmiyor, yarın açıkla.
```

### Haftalık ritüel (haftanın son günü: değerlendirme günü)

- Haftayı değerlendir: ne bitti, ne sarktı? Sarkan işi tamponda kapat.
- Oracle kontrol listesinde işaretlenenleri `PROGRESS.md`'ye işle.
- Haftanın branch'i bittiyse pull request aç, CI'ın geçtiğini gör (Hafta 6'dan itibaren), `main`'e merge et.
- Gelecek haftanın hedefini `PLAN.md`'den hatırlat.
- Kapsam küçültme yalnızca kullanıcı isterse yapılır (`PLAN.md` Bölüm 7).

### Git ve commit

**Her gün en az bir commit ve push.** GitHub'daki günlük katkı grafiği de portföyün bir parçası; düzenli çalışmayı gösterir.

**Branch düzeni:**
- `main` her zaman çalışır durumdadır. Doğrudan `main`'e commit atılmaz (ilk gün hariç).
- Her hafta veya her özellik için bir branch: `feature/ledger-schema`, `feature/transfer`, `feature/idempotency`, `perf/index`, `docs/readme` gibi.
- Branch bitince pull request açılır, PR açıklamasına ne yapıldığı ve nasıl test edildiği yazılır, sonra `main`'e merge edilir. Kullanıcı tek başına çalışsa da bu akış bankalardaki çalışma şeklidir ve mülakatta sorulur.

**Commit mesajı formatı: Conventional Commits, İngilizce.**

```
<tip>: <kısa açıklama, küçük harf, emir kipi, sonda nokta yok>
```

| Tip | Ne zaman | Örnek |
|---|---|---|
| `feat` | Yeni özellik | `feat: add idempotency key check to transfer endpoint` |
| `fix` | Hata düzeltme | `fix: reject transfer when currencies differ` |
| `test` | Test ekleme/değiştirme | `test: add concurrent transfer test for same account` |
| `perf` | Performans | `perf: add index on ledger_line(account_id, created_at)` |
| `refactor` | Davranış değiştirmeyen düzenleme | `refactor: move balance query to ledger service` |
| `docs` | Belge | `docs: add index benchmark results to olcumler.md` |
| `chore` | Yapılandırma, bağımlılık, araç | `chore: add docker compose for oracle free` |
| `ci` | CI ayarı | `ci: run maven verify on pull requests` |

**Commit kuralları:**
- Bir commit tek bir mantıksal değişiklik içerir. Gün içinde iki farklı iş yapıldıysa iki commit atılır.
- `main`'e giden kod derleniyor ve testler geçiyor olmalı. Branch'te gün sonu yarım iş varsa commit atılır ama mesaj dürüst olur: `feat: wip transfer service (debit line only)`.
- **Asla commit edilmeyecekler:** şifreler ve `.env` dosyası (yerine `.env.example`), `target/`, IDE dosyaları (`.idea/`, `*.iml`, `.vscode/`), Oracle veri volume'u, büyük test verisi dosyaları. Bunlar ilk gün `.gitignore`'a eklenir.
- Asistan commit mesajı önerebilir, ama `git add`, `git commit` ve `git push` komutlarını kullanıcı çalıştırır.
- Asistan her commit öncesi `git diff --staged` çıktısına bakar. Şifre, `.env` veya gereksiz dosya görürse uyarır.

### Kullanıcı takıldığında

Cevabı doğrudan verme. Şu sırayla ilerle:

1. Hata mesajını birlikte oku, ne dediğini sor.
2. Nereye bakması gerektiğini söyle (hangi dosya, kavram, doküman).
3. Hâlâ çözemezse ipucu ver, çözümü değil.
4. 30 dakikadan fazla sürdüyse çözümü ver, ama nedenini uzun uzun açıkla.

**İstisna:** ortam kurulumu, Docker, bağımlılık sürümleri gibi öğrenme değeri olmayan tıkanmalarda doğrudan çöz. Günün işleri belliyken bu tür tıkanmalarla zaman kaybetmek bedeli yüksek.

### Asla yapma

- Faz 1 bitmeden mikroservis, Kafka, outbox veya saga'ya geçme.
- Bir aşamanın bitti kriteri sağlanmadan sonrakine geçme.
- JPA/Hibernate'in SQL'i gizlemesine izin verme. Kritik sorgular **native SQL** yazılacak.
- Para alanlarında `double` veya `FLOAT` kullanılmasına izin verme. `BigDecimal` ve `NUMBER(19,4)` zorunlu.
- Ledger satırlarının güncellenmesine veya silinmesine izin verme. Düzeltme = ters kayıt.
- Frontend (React vb.) önerme. API'yi göstermek için Swagger UI yeterli.
- Bir güne birden fazla konu verme (bir konunun birden fazla maddesi olabilir).
- `PROGRESS.md` güncellemesini veya günlük commit'i atlama.
- Kullanıcının yerine `git commit` / `git push` çalıştırma.

### Ton

Türkçe konuş. Teknik terimleri İngilizce bırak (transaction, partition, saga). Kısa ve net ol, motivasyon konuşması yapma. Kullanıcı bir şeyi yanlış yaptıysa doğrudan söyle.

---

## 1. Proje nedir, ne işe yarar

### Tek cümleyle

**Para transferlerini çift kayıtlı muhasebe ilkesiyle tutan, Oracle üzerinde performansı ölçülmüş, sonraki fazda servis çökmelerine dayanıklı dağıtık bir yapıya dönüşen bir bankacılık çekirdeği.**

### İki faz

| Faz | Dönem | İçerik | Portföy hikâyesi |
|---|---|---|---|
| **Faz 1** | Ekim – Ocak | Tek servisli ledger, Oracle derinliği, testler, CI, README, demo videosu | "Oracle üzerinde çift kayıtlı, ölçülmüş performans verileri olan bir ledger" |
| **Faz 2** | Şubat – Nisan | Servislere bölme, Kafka, outbox, saga, yük testi, izleme | "Servis çökse bile tutarlı kalan dağıtık bir transfer sistemi" |

**Faz 1 kendi başına tamamlanmış bir proje olmalı.** Ocak sonunda banka başvuruları (Garanti BBVA Teknoloji Talent Spot vb.) başlıyor. O tarihte Faz 1 gösterilebilir durumda olacak, Faz 2 ise "şu an üzerinde çalıştığım kısım" olarak anlatılacak.

### Çözdüğü problem

**Faz 1:** Bir bankanın defteri nasıl tutulur ki hiçbir kuruş kaybolmasın, iki kere yaratılmasın ve tutarsızlık matematiksel olarak tespit edilebilsin? Aynı hesaba aynı anda iki transfer geldiğinde ne olur? Milyonlarca kayıt içinde bir hesabın ekstresi nasıl hızlı getirilir?

**Faz 2:** Sistem mikroservislere bölündüğünde tek bir veritabanı transaction'ının sağladığı garanti ortadan kalkar. "Kaynak hesaptan düştüm ama hedef hesaba yazamadım" durumunu hiçbir veritabanı geri almaz. Cevap: **Saga** (adımlar + telafi işlemleri) ve **Transactional Outbox** (veritabanı yazımı ile mesaj gönderimini atomik yapmak).

### Mülakat değeri

- **Faz 1 sonrası:** "Bakiyeyi neden saklamıyorsun?", "İki transfer aynı anda aynı hesaba gelirse?", "Bu sorgu neden yavaştı, nasıl hızlandırdın?" sorularına kendi ölçümlerinle cevap verebilmek.
- **Faz 2 sonrası:** "Transferin ortasında servis çökerse ne olur?" sorusuna kendi kodundan cevap verebilmek.

### Başarı kriterleri

| Kriter | Nasıl ölçülür | Faz |
|---|---|---|
| Ledger her an tutarlı | Borç toplamı = alacak toplamı, otomatik testle | 1 |
| Tekrarlanan istek çift işlem yaratmıyor | Aynı idempotency key ile 10 istek = 1 işlem | 1 |
| Eşzamanlı transferler bakiyeyi bozmuyor | Paralel test: hesap eksiye düşmüyor | 1 |
| Performans ölçülmüş | İndeks, partition, kilitleme öncesi/sonrası tablolar | 1 |
| Her push'ta testler otomatik koşuyor | GitHub Actions yeşil | 1 |
| Servis çökmesi veri bozmuyor | Transfer ortasında servis öldür, toplam yine sıfır | 2 |
| Mesaj kaybı yok | Yayıncıyı durdur, işlem yap, başlat: hepsi ulaşıyor | 2 |

---

## 2. Teknoloji yığını

| Katman | Seçim | Faz | Neden |
|---|---|---|---|
| Dil | **Java 21** | 1 | Hedef sektörün dili, LTS |
| Çatı | **Spring Boot 3.x** | 1 | Banka ilanlarında standart |
| Veritabanı | **Oracle Database Free (23ai)** | 1 | Bankaların tamamı Oracle kullanıyor |
| Şema yönetimi | **Flyway** | 1 | Şema versiyonlu |
| API dokümantasyonu | **springdoc-openapi (Swagger UI)** | 1 | Arayüz yerine API'yi tarayıcıdan göstermek |
| Test | **JUnit 5 + Testcontainers** | 1 | Gerçek Oracle'a karşı entegrasyon testi |
| CI | **GitHub Actions** | 1 | Her push'ta testler; depoda yeşil rozet |
| Çalıştırma | **Docker Compose** | 1 | Tek komutla tüm sistem |
| Mesajlaşma | **Apache Kafka** | 2 | Olay akışı, outbox yayını |
| Yük testi | **k6** | 2 | "Saniyede X transfer" rakamı |
| İzleme | **Actuator + Prometheus + Grafana** | 2 | Metrik, hazır panel |

**Docker imajı:** `gvenzl/oracle-free`

**Bilerek olmayanlar:** React/TypeScript paneli (backend portföyünde değeri düşük, maliyeti yüksek), kapsamlı kimlik doğrulama, gerçek ödeme altyapısına bağlantı.

---

## 3. Domain temeli: çift kayıtlı muhasebe

Üç kural:

1. Her işlem en az iki satır üretir: biri borç (debit), biri alacak (credit).
2. Bir işlemin satırlarının toplamı her zaman sıfırdır.
3. Satırlar asla güncellenmez veya silinmez. Düzeltme yeni bir **ters kayıt**tır.

**En kritik sonuç:** ACCOUNT tablosunda bakiye alanı **yoktur**. Bakiye, o hesaba ait ledger satırlarının toplamıdır.

| Hesap | Borç | Alacak |
|---|---|---|
| A hesabı | 100,0000 | — |
| B hesabı | — | 100,0000 |
| **Toplam** | **100,0000** | **100,0000** |

### Türkiye'ye özgü terimler

| Terim | Anlamı | Projedeki karşılığı |
|---|---|---|
| Havale | Aynı banka içi transfer | Anlık, limitsiz, 7/24 |
| EFT | Bankalar arası, TCMB üzerinden | Mesai saati kontrolü |
| FAST | 7/24 anlık bankalar arası | Tutar limiti kontrolü |
| Valör | Paranın kullanılabilir olduğu tarih | `JOURNAL_ENTRY.value_date` |
| Mutabakat | Kayıtların birbirini tutturma kontrolü | Gün sonu PL/SQL prosedürü |
| Ters kayıt | Hatalı işlemi iptal eden karşıt kayıt | `reverses_entry` alanı |

**Not:** EFT saatleri ve FAST limiti için güncel değerler TCMB'nin resmi sayfasından alınacak, README'de kaynak gösterilecek.

---

## 4. Mimari

### Faz 1: modüler tek uygulama

Tek bir Spring Boot uygulaması, tek Oracle şeması. Ama paket yapısı **baştan Faz 2'ye hazır** kurulacak:

```
com.<ad>.mizan
├── account/      -- hesap: entity, repository, service, controller
├── ledger/       -- defter: journal entry, ledger line, bakiye, ekstre
├── transfer/     -- transfer akışı, idempotency, transfer tipleri
└── common/       -- ortak hata yönetimi, yapılandırma
```

**Kural:** paketler birbirinin repository'sine doğrudan erişmez, sadece servis sınıfları üzerinden konuşur. Faz 2'de her paket ayrı servise dönüşecek; bu kural sayesinde bölme kolay olacak.

### Faz 2: dört servis

| Servis | Sorumluluğu | Şeması |
|---|---|---|
| **account-service** | Hesap yaşam döngüsü, durum, limitler | ACCOUNT |
| **ledger-service** | Çift kayıt defteri, tek yazma noktası | LEDGER |
| **transfer-service** | Saga orkestratörü | TRANSFER |
| **notification-service** | Bildirim; başarısızlığı transferi geri almaz | NOTIF |

Kafka partition key = hesap kimliği (aynı hesabın olayları sıralı işlenir).

---

## 5. Veri modeli

### ACCOUNT

```
account_id      NUMBER        PK, sequence
iban            VARCHAR2(34)  UNIQUE NOT NULL
customer_id     NUMBER        NOT NULL
currency        CHAR(3)       NOT NULL   -- TRY, USD, EUR
account_type    VARCHAR2(20)  NOT NULL   -- VADESIZ, VADELI
status          VARCHAR2(20)  NOT NULL   -- ACTIVE, BLOCKED, CLOSED
opened_at       TIMESTAMP     NOT NULL
version         NUMBER        -- iyimser kilitleme için
```

### JOURNAL_ENTRY: işlem başlığı

```
entry_id         NUMBER         PK, sequence
reference_no     VARCHAR2(40)   UNIQUE NOT NULL
transfer_type    VARCHAR2(10)   NOT NULL  -- HAVALE, EFT, FAST
description      VARCHAR2(200)
booking_date     DATE           NOT NULL
value_date       DATE           NOT NULL  -- valör
idempotency_key  VARCHAR2(64)   UNIQUE
reverses_entry   NUMBER         FK -> journal_entry
created_at       TIMESTAMP      NOT NULL
```

### LEDGER_LINE: borç/alacak satırları

```
line_id      NUMBER         PK, sequence
entry_id     NUMBER         FK -> journal_entry, NOT NULL
account_id   NUMBER         NOT NULL
direction    CHAR(1)        NOT NULL  -- D / C
amount       NUMBER(19,4)   NOT NULL CHECK (amount > 0)
currency     CHAR(3)        NOT NULL
created_at   TIMESTAMP      NOT NULL

-- Faz 1, Hafta 8: index (account_id, created_at)
-- Faz 1, Hafta 9: aylık range partition (created_at)
```

### Destek tabloları

| Tablo | Amacı | Faz |
|---|---|---|
| `ACCOUNT_LIMIT` | İşlem bazlı limitler (FAST limiti) | 1 |
| `RECONCILIATION_RUN` | Gün sonu mutabakat sonuçları | 1 |
| `OUTBOX` | Yayınlanacak olaylar | 2 |
| `SAGA_INSTANCE`, `SAGA_STEP` | Saga durumu | 2 |
| `PROCESSED_EVENT` | Tüketici tarafı idempotency | 2 |

### Değişmez kurallar

- Para alanları her yerde `NUMBER(19,4)` / `BigDecimal`.
- `LEDGER_LINE`'da UPDATE ve DELETE yasak. Trigger ile veritabanı seviyesinde engellenecek.
- Bakiye hiçbir tabloda saklanmaz.
- Her `JOURNAL_ENTRY` için satır toplamı sıfır olmalı; otomatik testle sürekli doğrulanır.

---

## 6. Ana akışlar

### Faz 1: transfer (tek transaction)

1. `POST /transfers`: kaynak IBAN, hedef IBAN, tutar, tip, idempotency key.
2. Idempotency kontrolü: key daha önce görüldüyse eski sonuç döner.
3. Kurallar: hesaplar aktif mi, para birimi aynı mı, FAST limiti, EFT saati, yeterli bakiye.
4. Kaynak hesap satırı kilitlenir (`SELECT ... FOR UPDATE` veya `@Version`, Hafta 6-7'de karşılaştırılacak).
5. **Tek transaction içinde:** JOURNAL_ENTRY + iki LEDGER_LINE yazılır.
6. Commit. Hata olursa hepsi geri alınır.

### Faz 2: saga

1. Saga başlar (`SAGA_INSTANCE` STARTED).
2. Adım 1: account-service limit/durum kontrolü.
3. Adım 2: ledger-service kayıt + aynı transaction'da OUTBOX.
4. Adım 3: outbox yayıncısı Kafka'ya basar.
5. Adım 4: notification-service bildirim üretir. Saga COMPLETED.

**Hata yolu:** adım başarısız olursa telafiler ters sırayla çalışır. Ledger telafisi = ters kayıt (`reverses_entry`). Saga COMPENSATED olur, ledger toplamı yine sıfırdır.

**Outbox ilkesi:** "en az bir kez teslimat + idempotent tüketici = tam olarak bir kez etki."

---

## 7. Aşamalar ve bitti sayılma kriterleri

> **Asistana not:** bu sıra bağlayıcıdır. Haftalık detay `PLAN.md`'dedir.

### FAZ 1 (Ekim – Ocak)

**Aşama 0 — Ortam.** Docker'da Oracle, SQLcl ile terminal bağlantısı, Spring Boot bağlantısı, Flyway.
*Bitti:* `SELECT SYSDATE FROM DUAL;` terminalden çalışıyor, uygulama hatasız kalkıyor.

**Aşama 1 — Doğru ledger.** Şema, transfer, bakiye, negatif bakiye engeli, idempotency, ekstre, transfer tipleri.
*Bitti:* 1000 rastgele transfer sonrası `SUM(D) - SUM(C) = 0`; aynı key ile 10 istek = 1 işlem.

**Aşama T — Test ve CI.** Testcontainers entegrasyon testleri, eşzamanlılık testi, GitHub Actions.
*Bitti:* `mvn verify` gerçek Oracle'a karşı yeşil; GitHub'da her push'ta testler koşuyor.

**Aşama 2 — Oracle derinliği.** Bölüm 8'deki Faz 1 zorunlu maddeleri.
*Bitti:* zorunlu maddelerin tamamı işaretli ve her birinin ölçümü `docs/olcumler.md`'de.

**Aşama P — Portföy paketi.** Swagger UI, README, mimari şeması, ölçüm belgesi, demo videosu.
*Bitti:* GitHub deposuna giren biri 5 dakikada projenin ne olduğunu, nasıl çalıştığını ve neyin ölçüldüğünü anlıyor; video 2-3 dakika.

### FAZ 2 (Şubat – Nisan)

**Aşama 3 — Servislere bölme, Kafka, outbox.**
*Bitti:* yayıncı durdurulur, 50 transfer, yayıncı başlatılır: 50 olayın hepsi ulaşır, çift işlem yok.

**Aşama 4 — Saga ve telafi.**
*Bitti:* transfer ortasında ledger-service `docker stop` ile öldürülür; saga COMPENSATED, ters kayıtlar var, toplam sıfır.

**Aşama 5 — Yük, izleme, portföy güncellemesi.** k6, Actuator + Prometheus + Grafana, README ve videonun güncellenmesi.
*Bitti:* README'de yük testi sonuçları ve Grafana ekran görüntüsü; yeni demo videosu saga senaryosunu içeriyor.

---

## 8. Oracle öğrenme planı

> **Bu bölüm projenin en önemli kısmı.** Kullanıcının CV'sindeki Oracle satırı buna dayanacak.

### Problem

**Varsayılan haliyle bu proje Oracle öğretmez.** JPA entity'leri yazılır, Hibernate SQL'i üretir, veritabanı hiç açılmaz. Kullanıcı CV'ye "Oracle" yazar, mülakatın ilk teknik sorusunda açığa düşer. **Asistanın görevi bunu engellemek.**

### Kontrol listesi

**Z = Faz 1 zorunlu · O = opsiyonel (vakit kalırsa veya 1Z0-071 hazırlığında)**

#### A. Temel

- [ ] A1 (Z): SQLcl / SQL*Plus ile terminalden bağlanıp sorgu yazıldı
- [ ] A2 (Z): Tablo, constraint, FK, check constraint elle tasarlandı
- [ ] A3 (Z): `CREATE SEQUENCE` ile referans numarası üretildi
- [ ] A4 (Z): `NUMBER(19,4)` ile para tutuldu
- [ ] A5 (Z): Flyway ile şema migration yönetildi

#### B. Sorgulama

- [ ] B1 (Z): Çoklu JOIN içeren rapor sorgusu native SQL ile yazıldı
- [ ] B2 (Z): Pencere fonksiyonu ile yürüyen bakiye: `SUM(...) OVER (PARTITION BY account_id ORDER BY created_at)`
- [ ] B3 (O): `WITH` (CTE) ile rapor sorgusu
- [ ] B4 (O): `EXISTS` / `IN` / JOIN karşılaştırması

#### C. Performans

- [ ] C1 (Z): `EXPLAIN PLAN FOR` + `DBMS_XPLAN.DISPLAY` ile plan okundu
- [ ] C2 (Z): 1 milyon satır üretildi, indekssiz süre ölçüldü
- [ ] C3 (Z): İndeks eklendi, süre ve plan değişimi belgelendi
- [ ] C4 (Z): LEDGER_LINE aylık range partition yapıldı
- [ ] C5 (Z): Partition pruning plan'da doğrulandı
- [ ] C6 (O): Bind variable etkisi gözlendi

#### D. Transaction ve eşzamanlılık

- [ ] D1 (Z): `SELECT ... FOR UPDATE` ile pesimistik kilitleme
- [ ] D2 (Z): İki terminal oturumuyla kilit bekleme denendi
- [ ] D3 (Z): Bilerek deadlock oluşturuldu, ORA-00060 gözlendi
- [ ] D4 (Z): `@Version` ile iyimser kilitleme
- [ ] D5 (Z): İki strateji eşzamanlı testle karşılaştırıldı, sonuç tablosu var
- [ ] D6 (O): READ COMMITTED / SERIALIZABLE farkı denendi

#### E. PL/SQL ve ileri özellikler

- [ ] E1 (Z): Gün sonu mutabakatı PL/SQL paketi (cursor, exception, `%ROWTYPE`)
- [ ] E2 (Z): Flashback Query denendi
- [ ] E3 (Z): LEDGER_LINE'da UPDATE/DELETE engelleyen trigger
- [ ] E4 (Z): Testcontainers ile gerçek Oracle'a karşı test

### Proje dışı destek

- **Oracle LiveSQL** (livesql.oracle.com): tarayıcıdan ücretsiz pratik.
- **Oracle SQL Explorer / Database Explorer** (mylearn.oracle.com): ücretsiz, ~3 saat.
- **1Z0-071**: 73 soru, 100 dk, %63 geçme notu, ~225 USD. Faz 1 bittikten sonra düşünülebilir.

### CV satırı (Faz 1 sonunda)

```
Oracle Database 23ai: PL/SQL (gün sonu mutabakatı), range partitioning,
Flashback Query, execution plan analizi (DBMS_XPLAN), pesimistik ve
iyimser kilitleme karşılaştırması, NUMBER(19,4) finansal hassasiyet
```

Bu satırdaki her madde kontrol listesinden geliyor ve mülakatta savunulabilir.

---

## 9. Portföy paketi (Aşama P)

İşe alımcı kodu çalıştırmaz. Depoya girer, README'yi okur, belki videoyu izler. Bu yüzden Aşama P, kod kadar önemlidir.

### README içeriği

1. Tek paragraflık özet: ne, neden.
2. Mimari şeması (draw.io veya Mermaid).
3. Temel tasarım kararları ve gerekçeleri: bakiye neden saklanmıyor, neden çift kayıt, neden `NUMBER(19,4)`, kilitleme seçimi.
4. Ölçüm özetleri (detayı `docs/olcumler.md`'de): indeks öncesi/sonrası, partition etkisi, kilitleme karşılaştırması.
5. Nasıl çalıştırılır: `docker compose up` ve birkaç örnek istek.
6. Demo videosu bağlantısı.
7. Yol haritası: Faz 2'de ne geliyor.
8. CI rozeti.

### Faz 1 demo videosu (2-3 dakika)

1. `docker compose up`, sistem kalkıyor.
2. Swagger'dan iki hesap aç, transfer yap.
3. Aynı idempotency key ile isteği tekrarla: ikinci işlem oluşmuyor.
4. Yetersiz bakiyeli transfer reddediliyor.
5. SQLcl'de `SUM(D) - SUM(C) = 0` sorgusu.
6. LEDGER_LINE'dan bir satır silmeyi dene: trigger engelliyor.
7. Execution plan öncesi/sonrası (ekran görüntüsü veya canlı).
8. Flashback ile bir hesabın 5 dakika önceki hali.

### Faz 2 demo videosu (Aşama 5'te)

Transfer başlat → ortasında ledger-service'i `docker stop` → saga COMPENSATED → ters kayıtlar → toplam sıfır → Grafana'da hata oranı yükselip düşüyor.

---

## 10. Başlangıç

Asistan bu belgeyi okuduktan sonra:

1. `PROGRESS.md` var mı bak. Yoksa oluştur ve "Gün 1" olarak başlat.
2. `PLAN.md`'den ilk günün görevini ver: GitHub deposu, `.gitignore` ve Docker'da Oracle Free.
3. Görevi ver, bitti kriterini söyle, kavramı kısaca açıkla.
4. Kullanıcı tamamladığında doğrula, `PROGRESS.md`'yi güncelle.

**Hatırlatma:** kodu kullanıcı yazacak. Sen yönlendirecek, açıklayacak ve gözden geçireceksin.
