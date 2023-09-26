import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

DateFormat dateFormater = new DateFormat('dd-MM-yyyy');

double screenWidth({var context, double? mulBy}) {
  return MediaQuery.of(context).size.width * mulBy!;
}

double screenHeight({var context, double? mulBy}) {
  return MediaQuery.of(context).size.height * mulBy!;
}

selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(), // Refer step 1
    firstDate: DateTime(1900),
    lastDate: DateTime(2025),
  );
  if (picked != null) return picked;
}

selectTime(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (picked != null) return picked;
}

String formatTimeOfDay(TimeOfDay tod) {
  final now = new DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
  final format = DateFormat.jm(); //"6:00 AM"
  return format.format(dt);
}

Map<String, dynamic> sampleData = {
  "questionare": [
    {
      "id": "bb49cb55-df04-4aad-9427-1d979ec5fe78",
      "question_type": "devider",
      "question": "Data Pemilih/Responden",
      "answer_options": []
    },
    {
      "id": "33c0e672-1ee5-4fe0-be80-e4a51b7f9297",
      "question_type": "text",
      "question": "Nama Lengkap Responden",
      "answer_options": []
    },
    {
      "id": "4e51a45c-167a-4fc6-867e-f811e30255c9",
      "question_type": "select",
      "question": "Status Responden Dalam Keluarga",
      "answer_options": [
        {
          "id": "6ec6bc4d-51c8-43cf-b69d-34e26caf0758",
          "option": "Kepala Keluarga"
        },
        {"id": "14998543-927c-442b-a9ee-7d8921b0d9c2", "option": "Suami"},
        {"id": "9c9b4560-1f02-404f-9333-e04210883106", "option": "Istri"},
        {"id": "4762c75a-7e01-471d-9f02-3941ae508af0", "option": "Anak"},
        {"id": "00373004-deed-4c9b-803f-4cef4c595bbd", "option": "Menantu"},
        {"id": "70f47a9d-70a8-4008-9294-d0e6fa2f1c0a", "option": "Cucu"},
        {"id": "25e27634-b6bb-4c10-9e4c-692d4c565b53", "option": "Orang Tua"},
        {"id": "b358e459-151f-4216-82c7-8a342b399086", "option": "Mertua"},
        {"id": "0e238084-6e64-4773-8c09-d5b9f9fe40d2", "option": "Famili Lain"},
        {"id": "c0a886a3-6660-45a0-9fb0-a5c31e9bf2f3", "option": "Pembantu"}
      ]
    },
    {
      "id": "49cf96b6-64ed-49bb-9789-a883c22cf7f5",
      "question_type": "text",
      "question": "Alamat",
      "answer_options": []
    },
    {
      "id": "9a69dee3-0e96-4310-a445-68e918f22346",
      "question_type": "text",
      "question": "Nomer HP",
      "answer_options": []
    },
    {
      "id": "43b58b6d-ff9a-4c5e-89e3-c29154c3c489",
      "question_type": "date",
      "question": "Tanggal Lahir",
      "answer_options": []
    },
    {
      "id": "5ed154a1-4d8c-4b50-842b-01a4563c7507",
      "question_type": "select",
      "question": "Jenis Kelamin",
      "answer_options": [
        {"id": "68c9d637-19b5-4ea7-8ff2-c69e8870e68a", "option": "Laki-laki"},
        {"id": "5e906186-a0f7-4d9c-8d29-d7d5bf2c9c0a", "option": "Perempuan"}
      ]
    },
    {
      "id": "f5ce0239-b47a-4de5-8357-1131a331dc8b",
      "question_type": "select",
      "question": "Agama",
      "answer_options": [
        {"id": "4b66e7b8-d590-414a-9ce9-d09d5f8ec3ae", "option": "Islam"},
        {"id": "195dcadf-4103-48ed-ae99-2b1cfa0be622", "option": "Kristen"},
        {"id": "fb7a776a-f27a-4762-9b91-b2d225630fcb", "option": "Katolik"},
        {"id": "c8907762-7400-4d07-aebb-329f4f88914e", "option": "Budha"},
        {"id": "76e80bcc-1ad0-43d1-934d-6df4ca887944", "option": "Hindu"},
        {"id": "7d87832d-6e68-468f-a5e1-62344d50ba7d", "option": "Konghucu"}
      ]
    },
    {
      "id": "4f56ea34-87f4-4507-9b4d-b70a93ee7dc7",
      "question_type": "select",
      "question": "Ijazah/Pendidikan Terakhir",
      "answer_options": [
        {
          "id": "933f2ed0-b012-457a-8742-6ea2c4555736",
          "option": "Belum/Tidak Sekolah"
        },
        {
          "id": "0f3f6153-f775-4d72-a0d1-0d18089274bc",
          "option": "Belum/Tidak Tamat SD"
        },
        {"id": "3e97fb78-5af1-445b-984a-ee91a8af6f3a", "option": "Tamat SD"},
        {
          "id": "6ceb663d-c26d-462a-8e4a-fa9f8ce5a9e7",
          "option": "SMP/Sederajat"
        },
        {
          "id": "aae3f9ad-7cee-482b-a38b-c382314c03d9",
          "option": "SMA/Sederajat"
        },
        {"id": "fa64b8cb-0f41-4f0e-83d5-5e9567dafa42", "option": "D-1/D-2/D-3"},
        {"id": "2468c32a-f52a-40ba-a993-33cea2be7d6a", "option": "D-4/S-1"},
        {"id": "ecd17180-a3ed-43d0-afac-d3da90be3cf3", "option": "S-2"},
        {"id": "62278c3d-e191-43a9-b9a9-81c8ea496702", "option": "S-3"}
      ]
    },
    {
      "id": "e28ce826-fb5a-491c-b307-f6c018417b6c",
      "question_type": "select",
      "question": "Pekerjaan",
      "answer_options": [
        {
          "id": "febb5da3-440a-44ed-9f51-1bd7ad4e595d",
          "option": "Belum/Tidak Bekerja"
        },
        {
          "id": "27c74752-aeaf-4b7c-a31e-c6600d67b7a4",
          "option": "Mengurus Rumah Tangga"
        },
        {
          "id": "07b44966-21d8-481c-ac57-c192c6827e40",
          "option": "Pelajar/Mahasiswa"
        },
        {"id": "35febcb5-be74-4f99-b325-07de663898f7", "option": "PNS"},
        {"id": "36bcb9d0-e172-4d8a-a618-9abde0de907a", "option": "TNI/POLRI"},
        {
          "id": "ca973783-03cc-49c3-a35e-2f2ffd5beee1",
          "option": "Pegawai/Karyawan Swasta"
        },
        {
          "id": "f8c8b65a-0418-4302-a713-ebf12fc1c6a8",
          "option": "Pegawai/Karyawan BUMN/BUMD"
        },
        {
          "id": "3085fca0-60c2-4721-b4ea-76321cbf0011",
          "option": "Petani/Pekebun/Peternak/Petambak/Nelayan"
        },
        {"id": "d1758cd9-5fcb-4bee-9427-333df39b9e77", "option": "Wirausaha"},
        {"id": "8d481ea4-973c-44c8-903c-cb4e127f17ee", "option": "Pedagang"},
        {"id": "59535bf5-31ee-4993-b375-e3a48189e9aa", "option": "Guru/Dosen"},
        {
          "id": "00bd0583-c6b9-402e-8206-905b44bd3f45",
          "option": "Pekerja Harian Lepas"
        },
        {
          "id": "3c32afac-e754-400f-86a0-5b465e4896da",
          "option": "Eksekutif Pemerintahan"
        },
        {
          "id": "5b8998c3-c44c-46ff-9723-8035fe79ea41",
          "option": "Anggota Dewan (DPR/DPRD/DPD)"
        },
        {
          "id": "a6c887f4-5d75-4549-a969-7dabc43a0134",
          "option": "Perangkat Desa"
        },
        {
          "id": "17538c4e-8e0a-41ab-9d4b-f56e575f4012",
          "option": "Ustadz/Pastur/Pemuka Agama"
        },
        {"id": "60b4a919-1df0-42ba-8ae1-84ec488f63bd", "option": "Lainnya"}
      ]
    },
    {
      "id": "b432d4a9-02cd-4865-a217-5e57e1595fc1",
      "question_type": "select",
      "question": "Strata Sosial",
      "answer_options": [
        {"id": "dca3a0b7-bea3-4acf-b854-2bf2d14805cb", "option": "Tidak Mampu"},
        {"id": "658109ef-c060-4414-ac27-d4b318e02f31", "option": "Menengah"},
        {"id": "ed3b636e-20c9-4f28-8471-fcbfb1251c26", "option": "Mampu"}
      ]
    },
    {
      "id": "59080233-954e-42b5-8728-267ee0a89508",
      "question_type": "text",
      "question": "Jumlah pemilih dalam keluarga",
      "answer_options": []
    },
    {
      "id": "aee289a5-af7f-4394-a931-a295759d021d",
      "question_type": "text",
      "question": "Jumlah Kartu Keluarga Dalam Keluarga",
      "answer_options": []
    },
    {
      "id": "fd3fbc14-87c2-4bfe-bf4d-bce19bfefebb",
      "question_type": "devider",
      "question": "Pengetahuan Tentang Pemilu 2024",
      "answer_options": []
    },
    {
      "id": "550939c9-b7c2-4fae-88c4-afbadb2b0801",
      "question_type": "radio",
      "question":
          "Apakah dari keluarga saudara tahu akan diadakan Pemilu Serentak pada tahun 2024?",
      "answer_options": [
        {
          "id": "84583cc5-c5a4-4c8b-95f5-bf7c8a78d5ae",
          "option": "Hanya tahu Pemilihan Presiden dan Wakil Presiden (Pilpres)"
        },
        {
          "id": "d7aa9552-4cac-4dc0-94db-60dd4d890790",
          "option": "Hanya tahu Pemilihan Anggota Legislatif (Pileg)"
        },
        {
          "id": "6cd8fb9c-cbfe-426e-bf86-baf560f61b13",
          "option":
              "Tahu (Pilpres, Pileg DPR, DPRD Kabupaten Kota, DPRD Provinsi, dan DPD)"
        },
        {"id": "b07d5676-3a3c-402f-bb39-686dd85be5c7", "option": "Tidak tahu"}
      ]
    },
    {
      "id": "03fb8f6e-f133-4882-83d1-e738960f40fa",
      "question_type": "radio",
      "question":
          "Apakah dari keluarga saudara tahu akan menggunakan hak pilih di mana? Memilih di Kecamatan/Desa mana atau tahu nomor TPS tempat memilihnya",
      "answer_options": [
        {"id": "b32e4208-63e2-4b56-bd44-a4842d032167", "option": "Sudah tahu"},
        {
          "id": "5053d2bf-d6c1-4cc4-9c24-0ed21e402e95",
          "option": "Belum/tidak tahu"
        },
        {"id": "c29a598e-4131-4c61-97ab-0c08b329cf52", "option": "TNI/Polri"}
      ]
    },
    {
      "id": "5151f42c-1967-4dc3-b56a-38212963f21f",
      "question_type": "devider",
      "question": "Pengenalan Kandidat",
      "answer_options": []
    },
    {
      "id": "253415ac-a58f-40d5-930f-b2638991910b",
      "question_type": "radio",
      "question": "Apakah dari keluarga saudara kenal dengan Sofhian Mile?",
      "answer_options": [
        {
          "id": "2f8e88ad-5dbd-443b-af2b-4a45f16321f8",
          "option": "Seluruh keluarga kenal"
        },
        {
          "id": "37940b66-56ac-4753-9cf5-c099e6c521e5",
          "option": "Sebagian keluarga kenal"
        },
        {
          "id": "d47bdfb6-bb7d-44e9-9ad8-bed2aab42356",
          "option": "Tidak sama sekali"
        }
      ]
    },
    {
      "id": "6bd87692-d4b2-4ae3-a0f3-e46de89278f6",
      "question_type": "radio",
      "question": "Jika kenal Sofhian Mile, dari mana?",
      "answer_options": [
        {
          "id": "cf0dd8f7-be32-48d8-b8fe-6e833b24e1a6",
          "option":
              "Keluarga/ saudara/ satu suku/ pernah bertemu/ hadir dalam acara"
        },
        {
          "id": "dbd938ea-6dcd-4772-b146-d96f02a6275e",
          "option":
              "Sebagai mantan bupati/ pernah Anggota DPR RI Fraksi Partai Golkar dari Sul-Teng"
        },
        {"id": "11fa6f8a-af85-4d22-89bf-c8a2a2a6a34d", "option": "Alat peraga"}
      ]
    },
    {
      "id": "423e7c34-d362-4e4c-83eb-131ca61077ef",
      "question_type": "radio",
      "question": "Apakah dari keluarga saudara menyukai Sofhian Mile?",
      "answer_options": [
        {
          "id": "eb167bf5-9583-477c-8b3e-5c0a9213acbd",
          "option": "Seluruh keluarga menyukai"
        },
        {
          "id": "642b014c-ac9a-4690-b757-71432f6d2007",
          "option": "Sebagian keluarga menyukai"
        },
        {
          "id": "31121353-3f33-4174-9381-cc686dadfc91",
          "option": "Seluruh keluarga tidak menyukai"
        }
      ]
    },
    {
      "id": "159105ad-2a7c-483f-840e-1559ca131e3f",
      "question_type": "radio",
      "question":
          "Apakah dari keluarga saudara tahu Sofhian Mile akan mencalonkan diri sebagai Anggota DPR RI tahun 2024 dari Partai NasDem? Tahu yaitu pernah diobrolkan, pernah mendapat informasi, atau melihat poster",
      "answer_options": [
        {
          "id": "ee367a87-0696-4148-998a-94f0359c635e",
          "option": "Seluruh keluarga tahu"
        },
        {
          "id": "5e6f6349-9735-436f-9779-16bfc4fdc1c1",
          "option": "Sebagian keluarga tahu"
        },
        {
          "id": "02f8493e-f883-4c70-9af8-8c8413afc42a",
          "option": "Tidak sama sekali"
        }
      ]
    },
    {
      "id": "b1dc6e18-384a-44c9-8d27-14868e29ca04",
      "question_type": "radio",
      "question":
          "Apakah dari keluarga saudara bersedia mendukung Sofhian Mile untuk menjadi anggota DPR RI?",
      "answer_options": [
        {
          "id": "98017575-5ea1-444f-a7fe-a1def52e53fe",
          "option": "Seluruh keluarga bersedia"
        },
        {
          "id": "0dedabb2-544f-47dd-9856-91a9ef5fbf0e",
          "option": "Sebagian keluarga bersedia"
        },
        {
          "id": "f44ee00d-73bc-47ab-8416-4dd93f6b8d7e",
          "option": "Belum ingin menjawab"
        },
        {
          "id": "d860b76b-775c-43a1-8a32-eb15dd0676d9",
          "option": "Sudah ada pilihan lain"
        }
      ]
    },
    {
      "id": "1b58f836-26f0-4031-9e4e-e789b8567833",
      "question_type": "radio",
      "question":
          "Selain Sofhian Mile, siapa saja yang saudara/dari keluarga tahu sebagai Bakal Calon Anggota DPR RI pada Pileg 2024?",
      "answer_options": [
        {"id": "114f7a59-641d-49d1-99b1-961596b63f7f", "option": "Tidak tahu"},
        {"id": "d4e98905-b2ba-42a8-bd71-2b95fea8ce6a", "option": "Yang lain"}
      ]
    },
    {
      "id": "4a7ff948-0234-42f2-a37f-ea17c80a3ce4",
      "question_type": "checkbox",
      "question":
          "Isu pembangunan apa yang di daerah saudara/keluarga merasa perlu untuk dibenahi?",
      "answer_options": [
        {"id": "1902c940-8890-422f-9a6c-cc442534a02b", "option": "Pendidikan"},
        {"id": "1485dbff-c3bc-4c27-ad73-0c0a437a606d", "option": "Kesehatan"},
        {
          "id": "f96388c2-50b8-409c-88e8-37993e359844",
          "option": "Lapangan Pekerjaan"
        },
        {
          "id": "5fd65b28-e1f1-4a52-804e-1d201da65ee7",
          "option": "Keamanan Masyarakat"
        },
        {
          "id": "59c844e4-2158-4ecd-8414-93839a246cf6",
          "option": "Lingkungan Lahan/Hutan dan Laut"
        },
        {
          "id": "5604128b-6035-4a6b-bcdb-8eeed14d25e3",
          "option": "Infrastruktur Jalan/Transportasi"
        }
      ]
    },
    {
      "id": "d0de6368-d1df-4dad-b900-0e954c7fad91",
      "question_type": "radio",
      "question":
          "Apa harapan saudara/dari keluarga untuk Calon Anggota DPR RI periode 2024-2029?",
      "answer_options": [
        {
          "id": "6b142dd5-cebf-463d-8437-04b1b95ca0d7",
          "option": "Dapat mewakili kepentingan/aspirasi Daerah di Pusat"
        },
        {
          "id": "331c3c3f-2b48-4b9a-9a46-1284fb845f0b",
          "option": "Membawa program pembangunan ke Daerah"
        },
        {
          "id": "4bf79a9d-dfd8-4e32-a9ba-28e106238ac8",
          "option": "Dicintai rakyat di Daerah"
        }
      ]
    },
    {
      "id": "a815d5bb-f406-422d-b98b-165cb18c462c",
      "question_type": "devider",
      "question": "Preferensi Pemilu",
      "answer_options": []
    },
    {
      "id": "7062bcdc-8cbc-4e80-98bb-42357c2471cd",
      "question_type": "radio",
      "question":
          "Pada pemilu legislatif tahun 2014, partai apa yang saudara/keluarga pilih untuk DPR RI?",
      "answer_options": [
        {"id": "993afe28-fd98-425d-80b7-6ab7c1d60bc7", "option": "NasDem"},
        {"id": "f10083e5-f02d-442d-a981-77c59b21801c", "option": "PKB"},
        {"id": "cfc5ee4e-2d9f-4660-a97b-d0a84ee8d979", "option": "PKS"},
        {"id": "fcde918e-a1c8-4d12-8b7a-a992c10238e6", "option": "PDI-P"},
        {"id": "393baec3-584c-4346-acd3-8a40e1049728", "option": "Golkar"},
        {"id": "aa91d5e5-1aa9-4916-b143-298872e00633", "option": "Gerindra"},
        {"id": "f4a5cc37-dfa8-4c22-93dc-ac9922753e48", "option": "Demokrat"},
        {"id": "b7346642-b752-47e6-806c-8c14c3df64ac", "option": "PAN"},
        {"id": "e74c951a-501b-4540-bf14-d8a602489afa", "option": "PPP"},
        {"id": "fab251c8-34bd-49fb-9507-ad5e8de73352", "option": "Hanura"},
        {"id": "fba13212-92a4-4106-b1ef-391305cd48c0", "option": "PBB"},
        {"id": "e8a8d73c-833b-4714-bbcd-f1529cd6319b", "option": "PKPI"}
      ]
    },
    {
      "id": "28490326-a1fb-4573-8d54-4d33c0ce5ece",
      "question_type": "text",
      "question":
          "Siapa nama anggota caleg yang saudara/keluarga pilih untuk DPR RI tahun 2014?",
      "answer_options": []
    },
    {
      "id": "08d7d096-e18e-45aa-a6d9-aa4b6d171282",
      "question_type": "radio",
      "question":
          "Pada pemilu legislatif tahun 2019, partai apa yang saudara/keluarga pilih untuk DPR RI?",
      "answer_options": [
        {"id": "0709144e-2aa9-4805-b4a0-afe773f25db2", "option": "NasDem"},
        {"id": "95848c54-f60c-41ab-97ab-cfa389c0c81f", "option": "PKB"},
        {"id": "e9b55bfd-f891-4eb5-aad7-786b435d6cb7", "option": "PKS"},
        {"id": "9fcc8694-fb65-464b-9447-27e2451cbba1", "option": "PDI-P"},
        {"id": "f549282d-3d45-4e82-97df-ce430b2b50ea", "option": "Golkar"},
        {"id": "24520a1f-18ec-4465-befc-3273a2059c0c", "option": "Gerindra"},
        {"id": "416887a1-18b3-4f77-b177-5c7a8ba532a2", "option": "Demokrat"},
        {"id": "609c2f2f-0065-4cb5-8c0d-52333ec25495", "option": "PAN"},
        {"id": "842489d5-5e8e-426b-b519-7b5f2519b0c4", "option": "PPP"},
        {"id": "c13a93ae-55fd-43f9-bff9-db8204198b0d", "option": "Hanura"},
        {"id": "5f392841-4d40-4c2d-a79e-6f37803a3216", "option": "PBB"},
        {"id": "fa2d9376-8914-4a6e-b06b-6efd9cfcb3e9", "option": "PKPI"}
      ]
    },
    {
      "id": "bec4d87a-8260-4ea2-bcaf-e062ba71e832",
      "question_type": "text",
      "question":
          "Siapa nama anggota caleg yang saudara/keluarga pilih untuk DPR RI tahun 2019?",
      "answer_options": []
    },
    {
      "id": "36648a70-a2c6-49ce-9656-af1b05431514",
      "question_type": "radio",
      "question":
          "Dari ketiga nama berikut, siapa yang saudara/keluarga sukai untuk menjadi Presiden terpilih pada Pemilu tahun 2024?",
      "answer_options": [
        {
          "id": "f6eb3b6c-36a6-44d7-8862-df127249a921",
          "option": "Anies Baswedan"
        },
        {
          "id": "aa2d7545-6cfe-4003-a4d4-5ba656990a1e",
          "option": "Ganjar Pranowo"
        },
        {
          "id": "d1587a55-d76c-43f1-8692-6c2faeda0148",
          "option": "Prabowo Subianto"
        }
      ]
    },
    {
      "id": "6644172b-7206-472c-ba59-bb27ae928b50",
      "question_type": "devider",
      "question": "Upload",
      "answer_options": []
    },
    {
      "id": "33ac09a6-d4d6-4389-82f9-ae4da22da73f",
      "question_type": "attachment",
      "question": "Selfie dengan narasumber",
      "answer_options": []
    },
    {
      "id": "518d822e-aeca-4796-b1b8-3e89c26ecc22",
      "question_type": "attachment",
      "question": "Rumah",
      "answer_options": []
    },
    {
      "id": "e9740b5f-ba26-4210-b571-71a02fe08395",
      "question_type": "attachment",
      "question": "Attribute",
      "answer_options": []
    }
  ]
};
