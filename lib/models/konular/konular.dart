import 'konu.dart';

//Geçici olarak denemelik konu başlıkları
Konu konu1 = Konu(baslik: 'Renkler', resimLinki: 'https://cdn.pixabay.com/photo/2016/11/29/13/20/balloons-1869790_960_720.jpg', rota: '/renkler');
Konu konu2 = Konu(baslik: 'Sayılar', resimLinki: 'https://cdn.pixabay.com/photo/2015/04/24/18/21/numbers-738068_960_720.jpg',rota: '/sayilar');
Konu konu3 = Konu(baslik: 'Meslekler', resimLinki: 'https://en.islcollective.com/preview/201711/f/jobs-and-occupations-flashcards_102308_1.jpg', rota:'/meslekler');
Konu konu4 = Konu(baslik:'Hayvanlar', resimLinki: 'https://cdn.pixabay.com/photo/2016/06/28/18/04/animals-1485100_960_720.png', rota: '/hayvanlar');
Konu konu5 = Konu();

List<Konu> konular = [konu1,konu2, konu3, konu4];
//Renk, Hayvan, Meslek, Sayı, Şekil, Mevsim, Meyve/Sebze