report 33000895 "Equipment Master B2B"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\Equipment Master.rdl';

    Caption = 'Equipment Master';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem(Equipment; "Equipment B2B")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            column(companyinformation_Name; companyinformation.Name)
            {
            }
            column(Machine_Name; Name)
            {
            }
            column(Machine_Manufacturer; Manufacturer)
            {
            }
            column(Machine_Machine_Capacity; Equipment.Capacity)
            {
            }
            column(Machine__Year_Of_Purchase_; "Year of Purchase")
            {
            }
            column(Sl_No_; "Sl.No")
            {
            }
            column(Machine__Service_Contact_Person_; "Service Contact Person")
            {
            }
            column(Machine__Manufacturer_Address_; "Manufacturer Address")
            {
            }
            column(Machine_Machine__Source_Of_Spares__; Equipment."Source of Spares")
            {
            }
            column(Machine_No; "No.")
            {
            }
            column(Machine_Machine__Tele__No_; Equipment."Tele. No.")
            {
            }
            column(Equipment_ListCaption; Equipment_ListCaptionLbl)
            {
            }
            column(DEPARTMENT___MAINTENANCECaption; DEPARTMENT___MAINTENANCECaptionLbl)
            {
            }
            column(Machine_NameCaption; Machine_NameCaptionLbl)
            {
            }
            column(MakeCaption; MakeCaptionLbl)
            {
            }
            column(Year_of_purchaseCaption; Year_of_purchaseCaptionLbl)
            {
            }
            column(Contact_personCaption; Contact_personCaptionLbl)
            {
            }
            column(Manufacturer_AddressCaption; Manufacturer_AddressCaptionLbl)
            {
            }
            column(Source_Of_Spares___Tele__NoCaption; Source_Of_Spares___Tele__NoCaptionLbl)
            {
            }
            column(NoCaption; NoCaptionLbl)
            {
            }
            column(CapacityCaption; CapacityCaptionLbl)
            {
            }
            column(Sl_No_Caption; Sl_No_CaptionLbl)
            {
            }
            column(ServicePhoneNumber_Equipment; Equipment."Service Phone Number")
            {
            }

            trigger OnAfterGetRecord();
            begin
                "Sl.No" := "Sl.No" + 1;
                companyinformation.GET();
            end;
        }
    }

    requestpage
    {
        Caption = 'Equipment Master';

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        companyinformation: Record "Company Information";
        "Sl.No": Integer;
        Equipment_ListCaptionLbl: Label 'Equipment List';
        DEPARTMENT___MAINTENANCECaptionLbl: Label 'DEPARTMENT : MAINTENANCE';
        Machine_NameCaptionLbl: Label 'Machine Name';
        MakeCaptionLbl: Label 'Make';
        Year_of_purchaseCaptionLbl: Label 'Year of purchase';
        Contact_personCaptionLbl: Label 'Contact person';
        Manufacturer_AddressCaptionLbl: Label 'Manufacturer Address';
        Source_Of_Spares___Tele__NoCaptionLbl: Label 'Source Of Spares & Tele. No';
        NoCaptionLbl: Label 'No';
        CapacityCaptionLbl: Label 'Capacity';
        Sl_No_CaptionLbl: Label 'Sl.No.';
}

