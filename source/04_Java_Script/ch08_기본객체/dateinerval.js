/* dateinterval.js*/
Date.prototype.getIntervalDay = function(that){
  //now.getIntervalDay(openday) : now는 this, openday는 that
//   if(this>that){
//    var intervalMillisec = this.getTime() - that.getTime();
//   }else{
//    var intervalMillisec = that.getTime() - this.getTime();    //이거쓰거나 아래거 사용
// }
  let intervalMilliSec = Math.abs(this.getTime() - that.getTime());
  let day = Math.trunc( intervalMilliSec / (1000*60*60*24));
  return day;
}
let now = new Date();
let openday = new Date(2023, 5, 26, 9, 30, 0); //개강시점
console.log('now ~ openday 날짜 :' + now.getIntervalDay(openday) + '일<br>');
console.log('now ~ openday 날짜 :' + openday.getIntervalDay(now) + '일<br>');