package gust.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BarcodeScanRequest {
    private String barcode;
    private String productName;
    private int sugarGrams;
}
