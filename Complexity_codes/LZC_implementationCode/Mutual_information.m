function [Out] = Mutual_information(Samples_1,Samples_2,alphabet_size_1,alphabet_size_2)
     Temp = lempel_ziv_v1(Samples_1,alphabet_size_1) +  lempel_ziv_v1(Samples_2,alphabet_size_2) ;
     Combined_signals = Samples_1 * alphabet_size_2 + Samples_2;
     Out = Temp - lempel_ziv_v1(Combined_signals,alphabet_size_1*alphabet_size_2);
end
