# Mizan — Çalışma Planı

**Tek kişi · Her gün tek konu, belirli işler (genelde 1-2 saat) · Faz 1: Gün 1–96 · Faz 2: Gün 97+**

> Bu dosya `CLAUDE.md` ile birlikte proje kökünde durur. Claude Code günlük görevi buradan verir, ilerlemeyi `PROGRESS.md`'ye yazar.

---

## 1. Nasıl kullanılır

- Plan **sıralı numaralı günlerden** oluşur: Gün 1, Gün 2, Gün 3… Günler takvimdeki hafta günlerine bağlı değil.
- **Her gün tek konu.** Her günün bitirilmesi gereken işleri bellidir. Süre esnektir; günün işleri makul bir çalışmayla (genelde 1-2 saat) bitecek büyüklükte tutulur.
- Gün başında o günün yapılacakları madde madde, bitti kriteriyle birlikte verilir. Gün, maddeler bitince biter. Bir gün çalışamazsan ertesi gün kaldığın numaradan devam edersin.
- Her haftanın **son günü değerlendirme günüdür**: haftayı gözden geçir, sarkan işi kapat, branch'i PR ile `main`'e merge et. Sarkma yoksa kısa tut.
- **Her gün sonunda commit + push.** Kurallar Bölüm 2'de.
- **Bir sonraki güne yalnızca kullanıcı "devam edelim" dediğinde geçilir.** Takvim tarihi, gecikme hesabı veya "geride/önde" değerlendirmesi yapılmaz; ilerleme sadece gün numarasıyla takip edilir.
- Bir güne tek bir konu verilir; o konunun maddeleri birden fazla olabilir. Bir gün makul bir sürede bitmiyorsa kalan madde ertesi güne devreder ve `PROGRESS.md`'ye yazılır; plan sıkıştırılmaz. Tampon günleri (Gün 16, 74, 78–81) sırası gelince normal gün gibi işlenir: sarkan iş varsa kapatılır, yoksa kısa geçilir.
- **[V]** işaretli günlerde önce 15-20 dakikalık video izlenir, sonra kod yazılır. Arama terimi yanında yazıyor.
- **[Oracle X1]** işareti, o gün `CLAUDE.md` Bölüm 8'deki maddenin işaretleneceğini gösterir.
- Günlük 75 dk İngilizce bu planın dışındadır.

---

## 2. Git ve commit (her gün)

Ayrıntılı kurallar `CLAUDE.md` Bölüm 0'daki "Git ve commit" başlığında. Kısa hali:

**Gün sonu komutları:**

```bash
git status                     # ne değişti
git add <dosyalar>             # sadece ilgili dosyalar, "git add ." yerine bilinçli seç
git diff --staged              # eklenenleri son kez gözden geçir
git commit -m "feat: add transfer endpoint with single transaction"
git push
```

**Branch akışı:**

```bash
git checkout main && git pull
git checkout -b feature/transfer      # haftanın / özelliğin branch'i
# ... günlük commit'ler ...
# haftanın son günü: GitHub'da PR aç → açıklamayı yaz → merge et
```

**Mesaj formatı:** `feat:` · `fix:` · `test:` · `perf:` · `refactor:` · `docs:` · `chore:` · `ci:` — İngilizce, küçük harf, emir kipi.

**Asla commit etme:** `.env`, şifreler, `target/`, `.idea/`, `*.iml`, Oracle veri klasörü.

**Her haftanın önerilen branch'i** aşağıda hafta başlığının yanında yazıyor.

---

## 3. Başlamadan önce

| Konu | Yeterli seviye | Eksikse |
|---|---|---|
| Java OOP, Collections, Exception | Rahat | Baeldung yazıları |
| `BigDecimal` | Paranın neden `double` ile tutulmadığını açıklayabilmek | `"BigDecimal vs double money Java"` |
| SQL: JOIN, GROUP BY, alt sorgu | Rahat | Oracle SQL Explorer (1s 27dk, ücretsiz) |
| Spring Boot: Controller/Service/Repository, JPA | Basit bir CRUD yazmış olmak | Küçük bir CRUD denemesi |
| Git: commit, branch, push, PR | Rahat | `"git branch pull request tutorial"` |
| Docker: imaj, konteyner, port | Temel kavram | `"Docker tutorial for beginners"` |

---

## 4. FAZ 1 (Gün 1–96)

**Hedef:** GitHub'da README'si, testleri, CI'ı, ölçüm belgesi ve demo videosu olan, kendi başına tamamlanmış bir ledger projesi.

### Hafta 1 · Gün 1–5 · Ortam → Aşama 0 · `main`

| Gün | Görev | Bitti kriteri |
|---|---|---|
| **Gün 1** | GitHub'da `mizan-ledger` deposunu oluştur, açıklamasını `CLAUDE.md`'nin başından kopyala. `.gitignore` (Java/Maven, IntelliJ, `.env`), boş README, `.env.example`. **[V]** `"run Oracle database in Docker"`, `gvenzl/oracle-free` konteynerini kaldır. | Depo push edildi, konteyner "DATABASE IS READY" |
| **Gün 2** | SQLcl kur, terminalden bağlan, uygulama kullanıcısını (şemayı) oluştur. Komutları `db/setup.sql`'e kaydet. | `SELECT SYSDATE FROM DUAL;` **[Oracle A1]** |
| **Gün 3** | **[V]** `"Docker Compose tutorial"`. `docker-compose.yml`: Oracle, port, volume, healthcheck. Şifre `.env`'den gelsin. | `docker compose up` tek komutta kalkıyor |
| **Gün 4** | Spring Initializr ile proje: group `com.<ad>`, artifact `mizan` (Web, JPA, Validation, Flyway, Oracle JDBC). Oracle bağlantı ayarları. | Uygulama hatasız kalkıyor |
| **Gün 5** | **[V]** `"Flyway Spring Boot tutorial"`. İlk deneme migration'ı. Kısa haftalık değerlendirme. | Flyway tabloyu oluşturdu **[Oracle A5] → AŞAMA 0 BİTTİ** |

> Hafta 1 ilk kurulum haftası olduğu için doğrudan `main`'e commit atılır. Hafta 2'den itibaren branch akışı başlar.

### Hafta 2 · Gün 6–12 · Şema · `feature/ledger-schema`

| Gün | Görev | Bitti kriteri |
|---|---|---|
| **Gün 6** | **[V]** `"double entry bookkeeping explained"` + `"double entry accounting for software engineers"`. Kâğıt üzerinde 3 örnek işlemin borç/alacak satırlarını yaz. | Kavramı kendi cümlelerinle anlatabiliyorsun |
| **Gün 7** | **[V]** `"designing a ledger database schema"`. Paket yapısını kur (account / ledger / transfer / common). ACCOUNT migration'ı: constraint, check constraint elle. | **[Oracle A2]** |
| **Gün 8** | JOURNAL_ENTRY migration'ı ve sequence. | **[Oracle A3]** |
| **Gün 9** | **[V]** `"BigDecimal vs double in Java money"`. LEDGER_LINE migration'ı: `NUMBER(19,4)`, FK, `CHECK (amount > 0)`. | **[Oracle A4]** |
| **Gün 10** | Entity'ler (`BigDecimal`) ve repository'ler. | Kaydedilip okunabiliyor |
| **Gün 11** | `POST /accounts` ve springdoc-openapi. | Swagger UI'dan hesap açılıyor |
| **Gün 12** | **Değerlendirme.** PR aç, merge et. | |

### Hafta 3 · Gün 13–19 · Transfer · `feature/transfer`

| Gün | Görev | Bitti kriteri |
|---|---|---|
| **Gün 13** | **[V]** `"Spring @Transactional explained"`. Transfer servisinin iskeleti ve DTO'ları. | Derleniyor |
| **Gün 14** | Transfer servisi: JOURNAL_ENTRY + iki LEDGER_LINE tek transaction'da. | Ya iki satır birlikte yazılıyor ya hiç |
| **Gün 15** | `POST /transfers` ve girdi validasyonu. | Swagger'dan transfer yapılıyor |
| **Gün 16** | **Tampon.** Sarkan iş varsa kapat. | |
| **Gün 17** | `@ControllerAdvice` ile merkezi hata yönetimi, anlamlı hata gövdesi. | Geçersiz isteklere tutarlı hata dönüyor |
| **Gün 18** | Bakiye: native SQL `SUM`, `GET /accounts/{id}/balance`. Yetersiz bakiyede transferi reddet. | Bakiye doğru, eksiye düşmüyor |
| **Gün 19** | **Değerlendirme.** PR, merge. | |

### Hafta 4 · Gün 20–26 · Idempotency, ekstre, transfer tipleri · `feature/statement`

| Gün | Görev | Bitti kriteri |
|---|---|---|
| **Gün 20** | **[V]** `"idempotency key explained"`. Tasarım: key nerede tutulur, tekrar gelince ne döner. | Tasarım `PROGRESS.md`'de |
| **Gün 21** | Idempotency'yi uygula. | Aynı key ile 10 istek = 1 işlem |
| **Gün 22** | Hesap ekstresi: native SQL, JOIN. | **[Oracle B1]** |
| **Gün 23** | Ekstreye tarih aralığı ve sayfalama. | |
| **Gün 24** | **[V]** `"SQL window functions tutorial"`. Ekstreye yürüyen bakiye. | **[Oracle B2]** |
| **Gün 25** | Havale/EFT/FAST: ACCOUNT_LIMIT, FAST limiti, EFT saat kuralı. Güncel değerleri TCMB'den al. | Üç tip farklı davranıyor |
| **Gün 26** | **Değerlendirme.** PR, merge. | |

### Hafta 5 · Gün 27–33 · Doğrulama ve testler · `test/integration`

| Gün | Görev | Bitti kriteri |
|---|---|---|
| **Gün 27** | 1000 rastgele transfer üreten bir test/script ve toplam kontrolü. | `SUM(D) - SUM(C) = 0` **→ AŞAMA 1 BİTTİ** |
| **Gün 28** | **[V]** `"Testcontainers Spring Boot tutorial"`. Gerçek Oracle'a karşı ilk entegrasyon testi. | Test yeşil **[Oracle E4]** |
| **Gün 29** | Testler: idempotency, yetersiz bakiye. | Yeşil |
| **Gün 30** | Testler: ledger toplamı sıfır, transfer tipi kuralları. | Yeşil |
| **Gün 31** | Eşzamanlılık testi: aynı hesaptan 20 paralel transfer (`ExecutorService`). **Muhtemelen başarısız olacak; bu beklenen bir sonuç.** | Test yazıldı, sonucu gözlendi |
| **Gün 32** | Neden başarısız oldu? Race condition'ı analiz et, `PROGRESS.md`'ye yaz. Test şimdilik `@Disabled`, gerekçesi yorumda. | Problem anlaşıldı |
| **Gün 33** | **Değerlendirme.** PR, merge. | |

### Hafta 6 · Gün 34–40 · CI ve pesimistik kilitleme · `ci/github-actions`, sonra `feature/locking`

| Gün | Görev | Bitti kriteri |
|---|---|---|
| **Gün 34** | GitHub Actions workflow'u: `mvn verify`. | Workflow çalışıyor |
| **Gün 35** | Testcontainers CI'da çalışıyor, README'ye rozet. PR'ı merge et. | Yeşil rozet **→ AŞAMA T BİTTİ** |
| **Gün 36** | **[V]** `"optimistic vs pessimistic locking"` + `"database transaction isolation levels explained"`. `SELECT ... FOR UPDATE` ile kaynak hesabı kilitle. | **[Oracle D1]** |
| **Gün 37** | Eşzamanlılık testinden `@Disabled`'ı kaldır. | Test artık geçiyor |
| **Gün 38** | İki SQLcl oturumu aç, kilit beklemeyi gözle. | Ekran görüntüsü **[Oracle D2]** |
| **Gün 39** | Bilerek deadlock oluştur. | ORA-00060 görüldü **[Oracle D3]** |
| **Gün 40** | **Değerlendirme.** PR, merge (CI artık PR'da koşuyor). | |

### Hafta 7 · Gün 41–47 · İyimser kilitleme ve karşılaştırma · `feature/optimistic-locking`

| Gün | Görev | Bitti kriteri |
|---|---|---|
| **Gün 41** | `@Version` ile iyimser kilitleme. | **[Oracle D4]** |
| **Gün 42** | Retry mantığı: çakışmada yeniden dene. | Eşzamanlılık testi bu stratejiyle de geçiyor |
| **Gün 43** | Karşılaştırma testi: aynı paralel yük, iki strateji, ölçülecek değerler. | Test kurulumu hazır |
| **Gün 44** | Ölç: süre, başarısız deneme ve retry sayısı. | Tablo **[Oracle D5]** |
| **Gün 45** | `docs/olcumler.md` dosyasını başlat, kilitleme sonuçlarını yaz. | |
| **Gün 46** | Hangi stratejiyi neden seçtiğini yaz, kodda o stratejiyi bırak. | Gerekçe belgede |
| **Gün 47** | **Değerlendirme.** PR, merge. | |

### Hafta 8 · Gün 48–54 · Performans: indeks · `perf/index`

| Gün | Görev | Bitti kriteri |
|---|---|---|
| **Gün 48** | 1 milyon LEDGER_LINE üret (`INSERT ... SELECT ... CONNECT BY` veya PL/SQL döngüsü). Script `db/` altında. | Tablo doldu |
| **Gün 49** | **[V]** `"Oracle execution plan explained"`. Ekstre sorgusunun planını oku. | **[Oracle C1]** |
| **Gün 50** | İndekssiz süreyi ölç (birkaç tekrar, ortalama). | **[Oracle C2]** |
| **Gün 51** | **[V]** `"Oracle indexes explained"`. `(account_id, created_at)` indeksini Flyway migration'ı olarak ekle. | |
| **Gün 52** | Tekrar ölç, planları yan yana koy. | **[Oracle C3]** |
| **Gün 53** | `docs/olcumler.md`'ye yaz. | |
| **Gün 54** | **Değerlendirme.** PR, merge. | |

### Hafta 9 · Gün 55–61 · Performans: partition · `perf/partitioning`

| Gün | Görev | Bitti kriteri |
|---|---|---|
| **Gün 55** | **[V]** `"Oracle table partitioning tutorial"`. Geçiş tasarımı. | Tasarım `PROGRESS.md`'de |
| **Gün 56** | Migration: aylık range partitioned yeni tablo. | |
| **Gün 57** | Veri taşıma, eski tablonun yerine geçiş. | **[Oracle C4]** |
| **Gün 58** | Bütün testler hâlâ geçiyor mu? | Yeşil |
| **Gün 59** | Partition pruning'i planda doğrula, tek aylık sorguyu ölç. | **[Oracle C5]** |
| **Gün 60** | `docs/olcumler.md`'ye yaz. | |
| **Gün 61** | **Değerlendirme.** PR, merge. | |

### Hafta 10 · Gün 62–68 · PL/SQL ve trigger · `feature/reconciliation`

| Gün | Görev | Bitti kriteri |
|---|---|---|
| **Gün 62** | **[V]** `"PL/SQL tutorial for beginners"`. RECONCILIATION_RUN tablosu. | |
| **Gün 63** | Mutabakat paketinin spec'i: prosedür imzaları. | Derleniyor |
| **Gün 64** | Paket body: cursor, exception handling, `%ROWTYPE`. | **[Oracle E1]** |
| **Gün 65** | LEDGER_LINE'da UPDATE/DELETE'i engelleyen trigger. | **[Oracle E3]** |
| **Gün 66** | Trigger'ı doğrulayan test. | Silme denemesi hata veriyor |
| **Gün 67** | Mutabakatı uygulamadan çağır (`@Scheduled` veya endpoint). | RECONCILIATION_RUN'a kayıt düşüyor |
| **Gün 68** | **Değerlendirme.** PR, merge. | |

### Hafta 11 · Gün 69–75 · Flashback ve ters kayıt · `feature/reversal`

| Gün | Görev | Bitti kriteri |
|---|---|---|
| **Gün 69** | **[V]** `"Oracle Flashback Query demo"`. Bir hesabın 10 dakika önceki hali. | **[Oracle E2]** |
| **Gün 70** | Ters kayıt tasarımı: kurallar ve kenar durumlar. | Tasarım `PROGRESS.md`'de |
| **Gün 71** | `POST /transfers/{id}/reversal`. Orijinal silinmez, `reverses_entry` dolar. | Ters kayıt doğru, toplam sıfır |
| **Gün 72** | Testler: iki kez ters kayıt yapılamaz, ters kaydın tersi olmaz. | Yeşil |
| **Gün 73** | Oracle kontrol listesini gözden geçir. | Tüm Z'ler işaretli **→ AŞAMA 2 BİTTİ** |
| **Gün 74** | **Tampon** | |
| **Gün 75** | **Değerlendirme.** PR, merge. | |

### Hafta 12 · Gün 76–82 · Hafif hafta · `refactor/cleanup`

| Gün | Görev |
|---|---|
| **Gün 76** | Kod temizliği: isimlendirme, ölü kod |
| **Gün 77** | Paket sınırları: paketler birbirinin repository'sine erişmiyor mu? |
| **Gün 78–81** | **Tampon.** Sarkan iş, opsiyonel bir Oracle maddesi (B3, B4, C6, D6) veya izin. Çalıştığın günlerde yine commit + push. |
| **Gün 82** | **Değerlendirme.** PR, merge. |

### Hafta 13 · Gün 83–89 · Portföy paketi · `docs/portfolio`

| Gün | Görev | Bitti kriteri |
|---|---|---|
| **Gün 83** | Swagger açıklamaları (endpoint ve alan açıklamaları). | |
| **Gün 84** | Swagger'da örnek istekler. | Bütün akış Swagger'dan denenebiliyor |
| **Gün 85** | Mimari şeması (Mermaid). | |
| **Gün 86** | README, ilk yarı: özet, şema, tasarım kararları. | |
| **Gün 87** | README, ikinci yarı: ölçüm özeti, çalıştırma, yol haritası. | |
| **Gün 88** | `docs/olcumler.md` son hali. | |
| **Gün 89** | **Değerlendirme.** PR, merge. | |

### Hafta 14 · Gün 90–96 · Demo videosu ve CV · `docs/demo`

| Gün | Görev | Bitti kriteri |
|---|---|---|
| **Gün 90** | Demo senaryosunu yaz (`CLAUDE.md` Bölüm 9). | |
| **Gün 91** | Prova, süre ölç. | 3 dakikanın altında |
| **Gün 92** | OBS ile kayıt. | |
| **Gün 93** | YouTube'a "liste dışı" yükle, README'ye bağla. | Video README'de |
| **Gün 94** | CV'ye proje ve Oracle satırı, LinkedIn güncellemesi. | |
| **Gün 95** | GitHub profili: depoyu sabitle, profil README'si. | |
| **Gün 96** | Son PR, merge, `v1.0` tag'i: `git tag -a v1.0 -m "Phase 1 complete"` ve `git push --tags`. | **→ FAZ 1 BİTTİ** |

### Faz 1 sonrası: Finaller ve başvurular

Proje kodu yok. İstersen:
- Garanti BBVA Teknoloji Talent Spot ve diğer açık başvurular
- Projeyi 2 dakikada Türkçe ve İngilizce anlatma provası, kaydet ve izle

---

## 5. FAZ 2 (Şubat – Nisan)

**Hedef:** Faz 1'deki modüler uygulamayı dört servise bölmek ve servis çökmesine dayanıklı hale getirmek.

> Günlük detay (Gün 97'den itibaren), Faz 1 bitince Faz 1'deki hıza bakılarak çıkarılacak. Aşağıdaki haftalık hedefler çerçevedir.

| Hafta | Dönem | Hedef |
|---|---|---|
| 17–18 | Şubat 1-2 | **[V]** `"microservices explained"`, `"database per service pattern"`. Çok modüllü Maven yapısı, dört şema |
| 19–20 | Şubat 3-4 | Dört servis ayrı çalışıyor, servisler arası senkron çağrı, compose güncellemesi |
| 21–22 | Mart 1-2 | **[V]** `"Apache Kafka tutorial"`, `"transactional outbox pattern"`, `"at least once delivery idempotent consumer"`, `"Kafka partition key ordering"`. Kafka, OUTBOX, yayıncı |
| 23 | Mart 3 | Tüketici idempotency (PROCESSED_EVENT). **Aşama 3 bitti kriteri** |
| 24–25 | Mart 4 – Nisan 1 | **[V]** `"saga pattern microservices"`, `"orchestration vs choreography"`, `"distributed transactions why two phase commit fails"`. Saga orkestratörü, mutlu yol |
| 26–27 | Nisan 2-3 | **[V]** `"compensating transactions explained"`. Telafi (Faz 1'deki ters kayıt kullanılacak), timeout, kaos senaryosu. **Aşama 4 bitti kriteri** |
| 28 | Nisan 4 | k6 yük testi, Actuator + Prometheus + Grafana |
| 29 | Mayıs 1 | README, ölçümler, demo videosu güncellemesi, `v2.0` tag'i. **Faz 2 bitti** |

Faz 2 bitirme projesi teslimine denk gelirse ilk kırpılacaklar Hafta 28'dekilerdir (k6 ve Grafana).

---

## 6. Günlük rutin

1. **Başlangıç:** `PROGRESS.md` ve `git log --oneline -5`; günün maddelerini al.
2. **Video:** [V] varsa izle. Sadece o günün konusu.
3. **Maddeler:** kodu yaz, maddeleri sırayla bitir. 30 dakika takılırsan Claude Code'a sor.
4. **Doğrulama:** her maddenin bitti kriterini kontrol et. Bitmeyen madde ertesi güne devreder.
5. **Kapanış:** `PROGRESS.md`'yi güncelle → `git add` → `git diff --staged` → `git commit` → `git push`.

---

## 7. Kapsam küçültme (sadece kullanıcı isterse)

Plan tarihe bağlı değildir; asistan kendiliğinden gecikme hesabı yapmaz veya kapsam küçültmez. Kullanıcı kapsamı daraltmak isterse şu sırayla kırpılır:

1. Gün 72'deki ters kayıt testleri Faz 2'ye kaydırılır.
2. Partition (Gün 55–61) Faz 2'nin başına kaydırılır, Faz 1 videosu partition olmadan çekilir.

**Faz 1'den asla kırpılmayacaklar:** doğru ledger + idempotency, Testcontainers testleri, CI, `FOR UPDATE` + eşzamanlılık testi, indeks ölçümü, PL/SQL mutabakat, README, demo videosu.
