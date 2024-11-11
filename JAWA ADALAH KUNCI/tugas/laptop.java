class laptop {
    //deklarasi atribut dalam laptop
    String pemilik;
    String merk;
    double ukuranlayar;

    //method untuk pencetakan hidupkan laptop
    String hidupkanLaptop() {
        return "Hidupkan Laptop";
    }
    //method untuk pencetakan matikan laptop
    String matikanLaptop(){
        return "Matikan Laptop";
    }


public static void main(String[] args) {
    // pembuatan atau inisiasi objek dari class laptop
        laptop laptopthifaal = new laptop();
        //input data atau nilai dari atribut
        laptopthifaal.pemilik = "Thifaal";
        laptopthifaal.merk = "Acer Nitro V15";
        laptopthifaal.ukuranlayar = 16;
        //print atau menampilkan atribut dari objek
        System.out.println(laptopthifaal.pemilik);
        System.out.println(laptopthifaal.merk);
        System.out.println(laptopthifaal.ukuranlayar);
        //tampilkan atau pemanggilan method untuk di running
        System.out.println(laptopthifaal.hidupkanLaptop());
        System.out.println(laptopthifaal.matikanLaptop());
    };
}


