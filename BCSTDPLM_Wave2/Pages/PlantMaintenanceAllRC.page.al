page 33058680 "PlantMaintenanceAllRC_B2B"
{
    Caption = 'Plant Maintenance';
    PageType = RoleCenter;
    actions
    {
        area(Sections)
        {
            group("Group")
            {
                Caption = 'Setups';

                action("Plant Maintenance Setup")
                {
                    RunObject = Page "Plant Maintenance Setup B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Specification Temp Setup")
                {
                    RunObject = Page "Specification Temp Setup B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Maintenance Schedule Setup")
                {
                    RunObject = Page "Maintenance Schedule Setup B2B";
                    ApplicationArea = Manufacturing;
                }

                action("Check List")
                {
                    RunObject = Page "Check List B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Run Time Frequency")
                {
                    RunObject = Page "Run Time Frequency List B2B";
                    ApplicationArea = Manufacturing;
                }
            }
            group("Lookups")
            {
                action("Equipment Locations")
                {
                    RunObject = Page "Equipment Locations B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Equipment Groups")
                {
                    RunObject = Page "Equipment Groups B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Specification Groups")
                {
                    RunObject = Page "Specification Groups B2B";
                    ApplicationArea = Manufacturing;
                }

                action("Specification Templates")
                {
                    RunObject = page "Specification Templates B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Frequency")
                {
                    RunObject = Page "Frequency B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Maintenance Unit")
                {
                    RunObject = Page "Maintenance Unit B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Complaint Line Types")
                {
                    RunObject = Page "Complaint Line Types B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Complaint Status")
                {
                    RunObject = Page "Complaint Status B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Criticality")
                {
                    RunObject = page "Criticality B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Maintenanced By")
                {
                    RunObject = Page "Maintenanced By B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Failure Types")
                {
                    RunObject = Page "Failure Types B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Maintenance Schedule")
                {
                    RunObject = Page "Maintenance Schedule Setup B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Movement Types")
                {
                    RunObject = Page "Movement Types B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Check List Parameters")
                {
                    RunObject = Page "Check List Parameters B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Maintenance Work Centers")
                {
                    RunObject = Page "Maintenance Work Centers B2B";
                    ApplicationArea = Manufacturing;
                }
            }
            group("Tasks")
            {
                action("Equipment List")
                {
                    RunObject = Page "Equipment List B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Resource")
                {
                    RunObject = Page "Resource List";
                    ApplicationArea = Manufacturing;
                }
                action("Spares List")
                {
                    RunObject = Page "Spare List NR B2B";
                    ApplicationArea = Manufacturing;
                }
            }
            group("Execution")
            {
                action("Preventive Maintenance Job Cards")
                {
                    RunObject = Page "PM Job List B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Break Down Job Cards")
                {
                    RunObject = Page "Breakdown Job List B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Other Job Cards")
                {
                    RunObject = Page "Others Job List B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Breakdown Registration")
                {
                    RunObject = Page "Breakdown Registration B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Breakdown Complaints")
                {
                    RunObject = Page "Breakdown Complaints List B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Sub-Con Work Sheet")
                {
                    RunObject = Page "Sub-Con Work Sheet B2B";
                    ApplicationArea = Manufacturing;
                }
            }
            group("Journals")
            {
                action("Equipment Journals")
                {
                    RunObject = page "Equipment Journals B2B";
                    ApplicationArea = Manufacturing;
                }
            }
            group("Periodic Activities")
            {
                action("PM Job Card Periodic")
                {
                    RunObject = Report "PM Job Card Perodic B2B";
                    ApplicationArea = Manufacturing;
                }
                action("PMR Schedule-Base Calendar")
                {
                    RunObject = Report "PMR Schedule-Base Calendar B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Equipment PMR Schedule")
                {
                    RunObject = Report "PMR Schedule (W/M) B2B";
                    ApplicationArea = Manufacturing;
                }
            }
            group("History")
            {
                action("Posted Job Cards")
                {
                    RunObject = page "Posted Job Cards B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Equipment Log")
                {
                    RunObject = page "Posted Equipment Log B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Equipment Check List")
                {
                    RunObject = page "Equipment Check Lists (JC) B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Posted Equipment Specs")
                {
                    RunObject = page "Equipment Specs List B2B";
                    ApplicationArea = Manufacturing;
                }
            }
            group("Reports")
            {
                action("Equipment Status")
                {
                    RunObject = Report "Equipment B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Equipment Job Card")
                {
                    RunObject = Report "Equipment Job Card History B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Equipment Master")
                {
                    RunObject = Report "Equipment Master B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Job Card Details")
                {
                    RunObject = report "Job Card Details B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Month Schedule")
                {
                    RunObject = Report "Month Schedule B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Monthly PMR Schedule")
                {
                    RunObject = Report "Monthly PMR Schedule (W/M) B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Movement List")
                {
                    RunObject = report "Movement List";
                    ApplicationArea = Manufacturing;
                }
                action("PMR Check List")
                {
                    RunObject = Report "PMR Check List B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Spares")
                {
                    RunObject = Report "Spares List B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Yearly PMR Schedule")
                {
                    RunObject = Report "Yearly PMR Schedule (W/M) B2B";
                    ApplicationArea = Manufacturing;
                }
                action("Work Order Tracking")
                {
                    RunObject = Report "Work Order Tracking Report B2B";
                    ApplicationArea = Manufacturing;
                }
                action("EquipmentWise BreakDown")
                {
                    RunObject = Report "EquipmentWise BreakDown B2B";
                    ApplicationArea = Manufacturing;
                }
            }

        }
    }
}

