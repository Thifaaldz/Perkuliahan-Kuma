class kalkulator {
    //definisi tipe data variabel dari attribut
    double operan1;
    double operan2;

    //konstruktor kalkulator
    public kalkulator() {
        this.operan1 =0;
        this.operan2 =0;
    }
    //method untuk pengisian data operan 1
    public void isiOperan1 (double x){
        this.operan1 = x;
    }
    //method untuk pengisian data operan 2
    public void isiOperan2 (double x){
        this.operan2 = x;
    }
//method untuk pejumlahan operan 1 dan operan 2
public double tambah(){
    return operan1+operan2;
} 
//method untuk pengurangan operan 1 dan operan 2
public double kurang() {
    return operan1+operan2;
}
//method untuk perkalian operan 1 dan operan 2
public double kali (){
    return operan1*operan2;
}
//method untuk pembagian operan 1 dan operan 2
public double bagi(){
    if (operan2 != 0) {
        return operan1/operan2;
        
    }
    else{
        System.out.println("Error karna 0");
        return Double.NaN;
    }
}
//method untuk pangkat operan 1 dan operan 2 menggunakan math.pow
public double pangkat(){
    return Math.pow(operan1, operan2);
}
}
//deklarasi public class calculator main
public class CalculatorMain {
    public static void main(String[] args) {
        //pembuatan objek dari class kalkulator
        kalkulator kalkulatorThifaal = new kalkulator();
        // mengisi data atau nilai  operan 1 dan 2
        kalkulatorThifaal.isiOperan1(10.0);
        kalkulatorThifaal.isiOperan2(4.0);
        //menampilkan atau print dari hasil kalkulator operan 1 dan 2
        System.out.println("Perjumlahan dari Operasi ="+kalkulatorThifaal.tambah());
        System.out.println("Pengurangan dari Operasi =" + kalkulatorThifaal.kurang());
        System.out.println("Perkalian dari Operasi =" + kalkulatorThifaal.kali());
        System.out.println("Pembagian dari operasi =" + kalkulatorThifaal.bagi());
        System.out.println("Pangkat dari Operasi ="+kalkulatorThifaal.pangkat());

    }
}
