# Clean Architecture e MethodChannel

Esse projeto tem como objetivo demonstrar o uso de Clean Architecture em projetos Flutter, além de ter um caso de uso com aplicação prática de MethodChannel para uso de código nativo Android e IOS.

## MethodChannel
O MethodChannel está implementado na página Home, para esse caso de uso foi utilizado o método nativo Android e IOS para capturar nível de bateria do device.
O nível de bateria está sendo exibido como poder na tela Home.

Para visualizar a funcionalidade, recomendo utilizar um dispositivo Android (emulador ou físico) ou em um dispositivo iOS físico. Isso ocorre porque o uso de emuladores iOS não permitem a captura do nível de bateria.

## Animações Avançadas
No projeto está implementado animações avançadas para melhorar a experiência do usuário. 
- Animação na exibição da lista de Pokemons na página Pokemons com Fade e Slide.
- Ao navegar pelo app, as transações dentre as páginas estão implementadas com animações diferentes.

## Testes
Testes foram implementados em diferenes camadas do projeto. 
- Domain Use Cases
- Stores
- Testes de Widgets em páginas principais

## Bibliotecas
Foram utilizadas no projeto apenas as bibliotecas essenciais para a implementação ser realizada com sucesso.
- HTTP
- MobX
- Get_it
- Go_router
- Build_runner
- Mockito
