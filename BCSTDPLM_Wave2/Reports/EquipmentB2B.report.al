report 33000890 "Equipment B2B"
{

    DefaultLayout = RDLC;
    RDLCLayout = 'BCSTDPLM_Wave2\Reports\Layouts\Equipment.rdl';

    Caption = 'Equipment';
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
            column(MachineCaption; MachineCaptionLbl)
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
            dataitem(Specification; "Specification B2B")
            {
                DataItemLink = "Machine ID" = FIELD("No.");
                DataItemTableView = SORTING("Specification Group Name");
                PrintOnlyIfDetail = false;
                column(Specification_SpecificationGroupName; "Specification Group Name")
                {
                }
                column(Specification_SpecificationName; "Specification Name")
                {
                }
                column(Specification_Value; Value)
                {
                }
                column(Specification_Description; Description)
                {
                }
                column(SpecificationsCaption; SpecificationsCaptionLbl)
                {
                }
                column(Specification_ID; ID)
                {
                }
                column(Specification_No_; "No.")
                {
                }
                column(Specification_Machine_ID; "Machine ID")
                {
                }
                column(Specification_Line_No_; "Line No.")
                {
                }
            }
            dataitem(Spare; "Spare B2B")
            {
                DataItemLink = "Machine ID" = FIELD("No.");
                DataItemTableView = SORTING("Machine ID");
                column(Spare_Description; Description)
                {
                }
                column(Spare_ItemName; "Item Name")
                {
                }
                column(Spare_ComponentName; "Component Name")
                {
                }
                column(SparesCaption; SparesCaptionLbl)
                {
                }
                column(Spare_ComponentNameCaption; FIELDCAPTION("Component Name"))
                {
                }
                column(Spare_ItemNameCaption; FIELDCAPTION("Item Name"))
                {
                }
                column(Spare_DescriptionCaption; FIELDCAPTION(Description))
                {
                }
                column(Spare_ID; ID)
                {
                }
                column(Spare_Machine_ID; "Machine ID")
                {
                }
                column(Spare_Line_No_; "Line No.")
                {
                }
            }
            dataitem("Maintenance Schedule Part"; "Maintenance Schedule Part B2B")
            {
                DataItemLink = "Machine ID" = FIELD("No.");
                DataItemTableView = SORTING("Machine ID");
                PrintOnlyIfDetail = true;
                column(Maintainance_schedule_Part_MaintSchTemplateName; "Maint. Sch. Template Name")
                {
                }
                column(Maintainance_schedule_Part_InspTypeName; "Maintenance Type Name")
                {
                }
                column(Maintainance_schedule_Part_FrequencyName; "Frequency Name")
                {
                }
                column(Maintainance_schedule_Part_NextDueDate; "Next Due Date")
                {
                }
                column(Maintainance_schedule_Part_CompName; "Component Name")
                {
                }
                column(Maintainance_schedule_Part_NoticeDays; "Notice Days")
                {
                }
                column(Maintainance_schedule_Part_StartDate; "Start Date")
                {
                }
                column(Maintainance_schedule_Part_HrsRequired; "Hrs Required")
                {
                }
                column(Maintainance_PartsCaption; Maintainance_PartsCaptionLbl)
                {
                }
                column(Maintainance_schedule_Part_CompNameCaption; FIELDCAPTION("Component Name"))
                {
                }
                column(Maintainance_schedule_Part_FrequencyNameCaption; FIELDCAPTION("Frequency Name"))
                {
                }
                column(Maintainance_schedule_Part_InspTypeNameCaption; FIELDCAPTION("Maintenance Type Name"))
                {
                }
                column(Maintainance_schedule_Part_StartDateCaption; FIELDCAPTION("Start Date"))
                {
                }
                column(Maintainance_schedule_Part_NoticeDaysCaption; FIELDCAPTION("Notice Days"))
                {
                }
                column(Maintainance_schedule_Part_NextDueDateCaption; FIELDCAPTION("Next Due Date"))
                {
                }
                column(Maintainance_schedule_Part_HrsRequiredCaption; FIELDCAPTION("Hrs Required"))
                {
                }
                column(Part_NameCaption; Part_NameCaptionLbl)
                {
                }
                column(Maintenance_schedule_Part_No_; "No.")
                {
                }
                column(Maintenance_schedule_Part_Machine_ID; "Machine ID")
                {
                }
                column(Maintenance_schedule_Part_Line_No_; "Line No.")
                {
                }
                dataitem("Equipment Schedule Line"; "Equipment Schedule Line B2B")
                {
                    DataItemLink = "Schedule Template ID" = FIELD("No.");
                    DataItemTableView = SORTING("Line Type Name");
                }
            }
        }
    }

    requestpage
    {

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
        MachineCaptionLbl: Label 'Machine';
        Machine_DetailsCaptionLbl: Label 'Machine Details';
        URL__CaptionLbl: Label 'URL :';
        SpecificationsCaptionLbl: Label 'Specifications';
        SparesCaptionLbl: Label 'Spares';
        Maintainance_PartsCaptionLbl: Label 'Maintainance Parts';
        Part_NameCaptionLbl: Label 'Part Name';
}

