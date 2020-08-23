Texts texts;

cameleon_texts(bool isCameleon){
  if(isCameleon){
    texts =  new Texts(
      menuText: 'Camaleões fêmeas podem viver até 180 anos. Já os machos, chegam aos 190, quando em bons cuidados, chegam até 192 anos.');
  }else {
    texts = new Texts(
      menuText: '180: Delegacia da Mulher\n\n190: Polícia Militar\n\n192: Samu');
  }

  return texts;
}

class Texts{
  final String menuText;

  Texts({
    this.menuText
  });

}