report 33000891 "Movements B2B"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\Movements.rdl';

    Caption = 'Movements';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem(Equipment; "Equipment B2B")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.";
            column(USERID; Format(USERID()))
            {
            }
            column(COMPANYNAME; COMPANYNAME())
            {
            }
            column(CurrReport_PAGENO; '')
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY(), 0, 4))
            {
            }
            column(Machine_Criticality; Criticality)
            {
            }
            column(Machine_IsInUse; "Is In Use")
            {
            }
            column(Machine__Service_Phone_Number_; "Service Phone Number")
            {
            }
            column(Machine__FixedAsset_Name_; "Fixed Asset Name")
            {
            }
            column(Machine_Manufacturer; Manufacturer)
            {
            }
            column(Machine_EquipmentType; "Equipment Type")
            {
            }
            column(Machine__Service_Contact_Person_; "Service Contact Person")
            {
            }
            column(Machine__Equipment_Name_; "Equipment Name")
            {
            }

            column(Machine__Calibration_Name_; "Calibration Name")
            {
            }
            column(Machine_ModelNo; "Model No.")
            {
            }
            column(Machine_ServiceAgency; "Service Vendor")
            {
            }
            column(Machine__Location_Name_; "Location Name")
            {
            }
            column(Machine_Name; Name)
            {
            }
            column(Machine_MaintainancedBy; "Maintainanced By")
            {
            }
            column(Machine_WarrantyExpiry; "Warranty Expiry")
            {
            }
            column(Machine__Parent_Machine_Reference_; "Parent Machine Reference")
            {
            }
            column(Machine__Vendor_Name_; "Vendor Name")
            {
            }
            column(Machine__Criticality_Option_; "Criticality Option")
            {
            }
            column(Machine__Usage_Name_; "Usage Name")
            {
            }
            column(Machine__MachineRef_Name_; "Machine Ref. Name")
            {
            }
            column(Machine__Template_Name_; "Template Name")
            {
            }
            column(Machine__Cost_Center_Name_; "Cost Center Name")
            {
            }
            column(Machine_Maintainer; Maintainer)
            {
            }
            column(Machine__Maintainance_Unit_Name_; "Maintainance Unit Name")
            {
            }
            column(Machine_No; "No.")
            {
            }
            column(Machine_MachineLocation; "Machine Location")
            {
            }
            column(Machine_TypeOfUse; "Type of Use")
            {
            }
            column(Machine_StatutoryInspection; "Statutory Inspection")
            {
            }
            column(Machine__Item_Name_; "Item Name")
            {
            }
            column(Machine_URL; URL)
            {
            }
            column(CurrReport_PAGENOCaption; CurrReport_PAGENOCaptionLbl)
            {
            }
            column(MovementsCaption; MovementsCaptionLbl)
            {
            }
            column(Machine_CriticalityCaption; FIELDCAPTION(Criticality))
            {
            }
            column(Machine_IsInUseCaption; FIELDCAPTION("Is In Use"))
            {
            }
            column(Machine__Service_Phone_Number_Caption; FIELDCAPTION("Service Phone Number"))
            {
            }
            column(Machine__FixedAsset_Name_Caption; FIELDCAPTION("Fixed Asset Name"))
            {
            }
            column(Machine_ManufacturerCaption; FIELDCAPTION(Manufacturer))
            {
            }
            column(Machine_EquipmentTypeCaption; FIELDCAPTION("Equipment Type"))
            {
            }
            column(Machine__Service_Contact_Person_Caption; FIELDCAPTION("Service Contact Person"))
            {
            }
            column(Machine__Equipment_Name_Caption; FIELDCAPTION("Equipment Name"))
            {
            }
            column(Machine__Calibration_Name_Caption; FIELDCAPTION("Calibration Name"))
            {
            }
            column(Machine_ModelNoCaption; FIELDCAPTION("Model No."))
            {
            }
            column(Machine_ServiceAgencyCaption; FIELDCAPTION("Service Vendor"))
            {
            }
            column(Machine__Location_Name_Caption; FIELDCAPTION("Location Name"))
            {
            }
            column(Machine_NameCaption; FIELDCAPTION(Name))
            {
            }
            column(Machine_MaintainancedByCaption; FIELDCAPTION("Maintainanced By"))
            {
            }
            column(Machine_WarrantyExpiryCaption; FIELDCAPTION("Warranty Expiry"))
            {
            }
            column(Machine__Parent_Machine_Reference_Caption; FIELDCAPTION("Parent Machine Reference"))
            {
            }
            column(Machine__Vendor_Name_Caption; FIELDCAPTION("Vendor Name"))
            {
            }
            column(Machine__Criticality_Option_Caption; FIELDCAPTION("Criticality Option"))
            {
            }
            column(Machine__Usage_Name_Caption; FIELDCAPTION("Usage Name"))
            {
            }
            column(Machine__MachineRef_Name_Caption; FIELDCAPTION("Machine Ref. Name"))
            {
            }
            column(Machine__Template_Name_Caption; FIELDCAPTION("Template Name"))
            {
            }
            column(Machine__Cost_Center_Name_Caption; FIELDCAPTION("Cost Center Name"))
            {
            }
            column(Machine_MaintainerCaption; FIELDCAPTION(Maintainer))
            {
            }
            column(Machine__Maintainance_Unit_Name_Caption; FIELDCAPTION("Maintainance Unit Name"))
            {
            }
            column(Machine_NoCaption; FIELDCAPTION("No."))
            {
            }
            column(Machine_MachineLocationCaption; FIELDCAPTION("Machine Location"))
            {
            }
            column(Machine_TypeOfUseCaption; FIELDCAPTION("Type of Use"))
            {
            }
            column(Machine_StatutoryInspectionCaption; FIELDCAPTION("Statutory Inspection"))
            {
            }
            column(Machine__Item_Name_Caption; FIELDCAPTION("Item Name"))
            {
            }
            column(Machine_DetailsCaption; Machine_DetailsCaptionLbl)
            {
            }
            column(URL__Caption; URL__CaptionLbl)
            {
            }
            dataitem(Movement; "Movement B2B")
            {
                DataItemLink = "Machine ID" = FIELD("No.");
                DataItemTableView = SORTING("Machine ID");
                column(Movement_LineType; "Line Type")
                {
                }
                column(Movement_Quantity; Quantity)
                {
                }
                column(Movement_SpareItem; "Spare Item")
                {
                }
                column(Movement_Description; Description)
                {
                }
                column(Movement_MovementType; "Movement Type")
                {
                }
                column(Movement_GpDate; "Gate Pass Date")
                {
                }
                column(Movement_GpNo; "Gate Pass No.")
                {
                }
                column(Movement_Type; Type)
                {
                }
                column(Movement_MovementDate; "Movement Date")
                {
                }
                column(Movement_VendorName; "Vendor Name")
                {
                }
                column(MovementsCaption_Control1102152091; MovementsCaption_Control1102152091Lbl)
                {
                }
                column(Movement_LineTypeCaption; FIELDCAPTION("Line Type"))
                {
                }
                column(Movement_SpareItemCaption; FIELDCAPTION("Spare Item"))
                {
                }
                column(Movement_QuantityCaption; FIELDCAPTION(Quantity))
                {
                }
                column(Movement_VendorNameCaption; FIELDCAPTION("Vendor Name"))
                {
                }
                column(Movement_MovementDateCaption; FIELDCAPTION("Movement Date"))
                {
                }
                column(Movement_TypeCaption; FIELDCAPTION(Type))
                {
                }
                column(Movement_GpNoCaption; FIELDCAPTION("Gate Pass No."))
                {
                }
                column(Movement_GpDateCaption; FIELDCAPTION("Gate Pass Date"))
                {
                }
                column(Movement_MovementTypeCaption; FIELDCAPTION("Movement Type"))
                {
                }
                column(Movement_DescriptionCaption; FIELDCAPTION(Description))
                {
                }
                column(Movement_ID; ID)
                {
                }
                column(Movement_Machine_ID; "Machine ID")
                {
                }
                column(Movement_Line_No_; "Line No.")
                {
                }
                column(Warrenty_Expire_CaptionLbl; Warrenty_Expire_CaptionLbl)
                {
                }
                column(Statutory_Inspection_CaptionLbl; Statutory_Inspection_CaptionLbl)
                {
                }
                column(Parent_Mach_Ref_CaptipnLbl; Parent_Mach_Ref_CaptipnLbl)
                {
                }
                column(Service_Contact_Person_CaptionLbl; Service_Contact_Person_CaptionLbl)
                {
                }
                column(Service_PhNo_CaptionLbl; Service_PhNo_CaptionLbl)
                {
                }
            }
        }
    }

    requestpage
    {
        Caption = 'Movements';

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
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        MovementsCaptionLbl: Label 'Movements';
        Machine_DetailsCaptionLbl: Label 'Machine Details';
        URL__CaptionLbl: Label 'URL :';
        MovementsCaption_Control1102152091Lbl: Label 'Movements';
        Warrenty_Expire_CaptionLbl: Label 'Warrenty Exp.';
        Statutory_Inspection_CaptionLbl: Label 'Stat.Insp.';
        Parent_Mach_Ref_CaptipnLbl: Label 'Parent Mach.Ref.';
        Service_Contact_Person_CaptionLbl: Label 'Ser.Cnt.Person';
        Service_PhNo_CaptionLbl: Label 'Ser.Cnt.Person';
}

