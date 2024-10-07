import 'package:dart_frog/dart_frog.dart';

import '../../../domain/news.dart';


Response onRequest(RequestContext context) {
  final newsList = [
    News(uid: 1, country: Countries.japan,
      title: 'Высокие температуры сохранятся в Японии в течение всего октября',
      text: 'Недавняя жара продолжает череду высоких температур, продолжавшихся все лето, при этом на востоке и западе Японии сентябрь был самым жарким за всю историю наблюдений.',
      datetime: DateTime(2023, 12, 2)
    ),
    News(uid: 2, country: Countries.japan, title: 'У оппозиционных партий мало времени, чтобы сформировать единый фронт перед выборами',
    text: 'Неожиданное заявление премьер-министра Сигэру Исибы о проведении всеобщих выборов 27 октября заставило других политиков спешно координировать свои действия, чтобы избежать многосторонних столкновений.',
    datetime: DateTime(2023, 9, 2)
    ),
    News(uid: 3, country: Countries.japan, title: 'Не воспринимайте нового лидера Японии буквально.',
      text: 'Ишиба обнаружит, что его запасы капитала у общественности быстро иссякнут, если он не попытается оторваться от своего предшественника.',
      datetime: DateTime(2023, 3, 25)
    ),
    News(uid: 4, country: Countries.japan, title: 'В Японии участились случаи заболеваний рук, ящура и полости рта',
      text: 'Число подтверждённых случаев ящура остаётся высоким в нескольких префектурах даже после ожидаемого пика заболеваемости летом, свидетельствуют данные органов здравоохранения.',
      datetime: DateTime(2023, 2, 23)
    ),
    News(uid: 4, country: Countries.russia, title: 'Министр обороны доложил Путину об освобождении Угледара',
      text: 'МОСКВА, 4 окт — РИА Новости. Министр обороны Андрей Белоусов доложил президенту Владимиру Путину об освобождении Угледара, заявил пресс-секретарь российского лидера Дмитрий Песков.',
      datetime: DateTime(2023, 7, 2)
    ),
    News(uid: 4, country: Countries.russia, title: 'Военные спасли украинского медика, который просил его добить',
      text: 'ДОНЕЦК, 4 окт — РИА Новости. Пленный военный медик украинской 59-й бригады Игорь Мацак рассказал РИА Новости, как его спасли российские бойцы, которых он просил его добить.',
      datetime: DateTime(2023, 4, 1)
    ),
    News(uid: 4, country: Countries.russia, title: 'Дизайнеров из России пригласили на Montenegro Fashion week',
      text: 'МОСКВА, 4 окт - РИА Новости. Вице-президент Montenegro Fashion week, черногорский модельер Марина Банович пригласила к участию дизайнеров из России на форуме BRICS+ Fashion Summit, отметив важность продолжения сотрудничества между РФ и Черногорией.',
      datetime: DateTime(2023, 5, 1)
    ),
    News(uid: 4, country: Countries.russia, title: '"Повесили и ударили топором". Что учинили подростки в Иркутской области',
      text: 'МОСКВА, 4 окт — РИА Новости, Дарья Юдкина. Подростки из села Котик жестоко расправились с собакой и засняли происходящее на телефон. Уголовное дело открывать не торопятся — в полиции утверждают, что пес жив. Зоозащитники в это не верят, приводя все больше доказательств обратного. РИА Новости разбиралось в громкой истории.',
      datetime: DateTime(2023, 1, 2, 23)
    ),
  ];


  if(!context.request.uri.queryParameters.containsKey('country')) return Response.json(statusCode: 400, body: 'Bad request. Not found country param.');
  final currentCountry = context.request.uri.queryParameters['country']!;


  return switch (context.request.method) {
    HttpMethod.get => Response.json(body: newsList.where((e) => e.country.name == currentCountry).map((e) => e.toJson()).toList()),
    _ => Response.json(statusCode: 501, body: 'Not implemented')
  };
}
