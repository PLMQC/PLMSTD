page 33000890 "PlantMaintenance RoleCenterB2B"
{
    // version B2BPLM1.00.00,Role Center1.0

    // ------------------------------------------------------
    // B2B Software Technologies
    // ------------------------------------------------------
    // Project : Plant Maintenance Addon
    // B2BPLM1.00.00
    // No.   Sign            Date        Description
    // -----------------------------------------------------------------------------------------------
    // 01    B2BPLM1.00.00  Jul2,2011   Deleted Sub Type Cash Receipt Voucher,Bank Receipt Voucher,Cash Payment Voucher,
    //                                  Bank Payment Voucher,General Voucher,Contra Voucher

    Caption = 'Role Center';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group(General)
            {
                part("PLM Processor Activities"; "PLM Processor Activities B2B")
                {
                    Caption = 'PLM Processor Activities';
                    ApplicationArea = all;
                }
                systempart(Outlook; Outlook)
                {
                    ApplicationArea = all;
                }
            }
            group(General2)
            {
                part("Equipment List"; "Equipment List Part B2B")
                {
                    Caption = 'Equipment List';
                    ApplicationArea = all;
                }
                systempart(MyNotes; MyNotes)
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("Plant Maintenance")
            {
                action(Equipment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Equipment Master is Used to Create Number of Equipments specific to Work Center Area.';
                    Image = Task;
                    RunObject = page "Equipment List B2b";
                }
                action(Resource)
                {
                    ApplicationArea = All;
                    ToolTip = 'Any Machinery Or/And Human Power can be Considered as a Resource. Resources are Using in the Equipment Maintenance.';
                    Image = Task;
                    RunObject = page 77;
                }
                action(Spares)
                {
                    ApplicationArea = All;
                    ToolTip = 'Spares can be Crearted as an Item Master with Spares Item Category. And these Spares can be Used in the Maintenance Work. Ex:- Welding Rods, Cotton Wastages Etc.,';
                    Image = Task;
                    RunObject = page "Spares Master B2B";
                }
            }
            group("Periodic Activities")
            {
                action("PM Job Card Periodic")
                {
                    ApplicationArea = All;
                    ToolTip = 'PM Job Card Periodic is Used to create Preventive Maintenance Job card.';
                    Image = Report;
                    RunObject = report 33000897;
                }
                action("PMR Schedule-Base Calendar")
                {
                    ApplicationArea = All;
                    ToolTip = 'PMR Schedule - Base Calendar Provides the data of Schedules based on Frequencya and Duration Filters.';
                    Image = Report;
                    RunObject = report 33000902;
                }
                action("Equipment PMR Schedule")
                {
                    ApplicationArea = All;
                    ToolTip = 'From Here User can Open the List of PMR job cards and Exicutes the Job cards Created fromthe PMR Schedule';
                    Image = Report;
                    RunObject = page 33000928;
                }
            }
            group(Journals)
            {
                action("Equipment Journals")
                {
                    ApplicationArea = All;
                    ToolTip = 'Any postings and adjustments pertaining to the run time or stop time against a machine that are not done through the PM/Breakdown Job cards can be done by through Equipment Journals.';
                    Image = Journal;
                    RunObject = page 271;
                }
            }
            group(Execution)
            {
                action("PM Job Cards")
                {
                    ApplicationArea = All;
                    ToolTip = 'Preventive Maintenance job cards are created based on the Schedule, to perform maintenance activities on the specified Equipments to overcome the Breakdowns and Losses. This PM job card contains the data like.. Frequency type, Maintenance tpe etc.,';
                    Image = TaskPage;
                    RunObject = page 33000913;
                }
                action("Breakdown Cards")
                {
                    ApplicationArea = All;
                    ToolTip = 'Breakdown Maintenance job cards created when sudden failure of equipment causes. Break down maintance can be done Intenally or Exteranally.';
                    Image = TaskList;
                    RunObject = page 33000957;
                }
                action("Other Cards")
                {
                    ApplicationArea = All;
                    ToolTip = 'Other job cards are used to create Other Maintenance Job cards, when the Maintenance is Other than PM and Breakdown.';
                    Image = TaskList;
                    RunObject = page 33000985;
                }
                action("Breakdown Registrations")
                {
                    ApplicationArea = All;
                    ToolTip = 'Based On criticality of the Equipment failure, User can Rise Breakdown Registration. It contains the registration in formation, criticality of the Equipment, Description of problem etc.,';
                    Image = TaskList;
                    RunObject = page 33000924;
                }
                action("Breakdown Complaints")
                {
                    ApplicationArea = All;
                    ToolTip = 'Breakdown Complaints raised against the Breakdown jobs, These compaliants details having data like.. Criticality of the problem, Status of the breakdown, Issue description etc.,';
                    Image = TaskList;
                    RunObject = page 33000984;
                }
                action("Other Maintenance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Other maintenance action is use When user creating the Other Maintenace Jobs, Small jobs (Welding, Cleaning, Painting etc.,) can be considered as Other maintenance.';
                    Image = Task;
                    RunObject = page 33000963;
                }
                action("Sub-contracting Worksheet")
                {
                    ApplicationArea = All;
                    ToolTip = 'Subcontracting work sheet is used to create Subcontracting (Purchase) order, for Equipment Service Vendors.';
                    Image = Worksheet;
                    RunObject = page 33000897;
                }
            }
            group(History)
            {
                action("Posted Job Cards")
                {
                    ApplicationArea = All;
                    ToolTip = 'Posted job cards Displys the Posted Preventive/Breakdown Maintenance Job Cards.';
                    Image = History;
                    RunObject = page "Posted Job Cards B2B";
                }
                action("Equipment Log")
                {
                    ApplicationArea = All;
                    ToolTip = 'Equipment Logs Displays the posted Equipments data like Durations, Maintenace types, Dates etc.,';
                    Image = History;
                    RunObject = page "Posted Equipment Log B2B";
                }
                action("Equipment Check List History")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Shows the Check list histories specific to Equipments';
                    Image = History;
                    RunObject = page "Equipment Check List B2B";
                }
                action("Posted Breakdown Complaints")
                {
                    ApplicationArea = All;
                    ToolTip = 'It shows the data of the Posted Breakdown complaints specific to Equipment';
                    Image = History;
                    RunObject = page "Rej./Close Breakdown List B2B";
                }
                action("Posted Equipment Specs List")
                {
                    ApplicationArea = All;
                    ToolTip = 'It displays Specifications Data against to the Equipment.';
                    Image = History;
                    RunObject = page "Equipment Specs List B2B";
                }
            }
            group(Setup)
            {
                action("Plant Maintenance Setup")
                {
                    ApplicationArea = All;
                    ToolTip = 'PM calendar, Allowances, No series related to Plant Maintenance documents and Posting journals and templates will be setup in Plant Maintenance Setup.';
                    Image = Setup;
                    RunObject = page "Plant Maintenance Setup B2b";
                }
                action("Specification Template Setup")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specification Template Setup is used to link the Specification templates, Specification Group IDs and Specification IDs.';
                    Image = Setup;
                    RunObject = page "Specification Temp setup B2B";
                }
                action("Maintenance Schedule Setup")
                {
                    ApplicationArea = All;
                    ToolTip = 'Maintenance Frequencies, Maintenance Types and Date Intervals will link in the Maintenance schedule Setup.';
                    Image = Setup;
                    RunObject = page "Maintenance Schedule Setup B2B";
                }
                action("Check List")
                {
                    ApplicationArea = All;
                    Tooltip = 'Check lists list of tasks, which are performing at the time';
                    Image = Setup;
                    RunObject = page "Check List B2B";
                }
                action("Run Time Frequency")
                {
                    ApplicationArea = All;
                    ToolTip = 'Run Time Frequency is a set up to the Equipment for which maintenance will be scheduled based on the Run hours or based on particular Metre Based readings like Kilometres or Miles etc.,';
                    Image = Setup;
                    RunObject = page "Run Time Frequency List B2B";
                }
                group(Lookups)
                {
                    action("Equipment Locations")
                    {
                        ApplicationArea = All;
                        ToolTip = 'It Defines the Location, at Which area the Equipment is Located';
                        Image = Setup;
                        RunObject = page "Equipment Locations B2b";
                    }
                    action("Equipment Groups")
                    {
                        ApplicationArea = All;
                        ToolTip = 'It specifies, The Equipments comes under in which category type. EX:- Mechanical, Electrical, Etc., ';
                        Image = Setup;
                        RunObject = page "Equipment Groups B2b";
                    }
                    action("Specification Groups")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifications are grouped in Specification group, These Specification groups can be defined based on the Equipment group. Ex:- Electical Specification group';
                        Image = Setup;
                        RunObject = page "Specification Groups B2b";
                    }
                    action("Specifications")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifications are the Different attributes specified against the Equipment. Ex:- For Electrical Equipment, Specifications would be Voltage, Resistance, etc.,';
                        Image = Setup;
                        RunObject = page "Specifications PLM B2b";
                    }
                    action("Specification Templates Lookup")
                    {
                        ApplicationArea = All;
                        ToolTip = 'A specification template is a generic specification for equipment. For a template user can assign Specifications and Specification Groups in the Specification Template Setup.';
                        Image = Setup;
                        RunObject = page "Specification Templates B2b";
                    }
                    action("Frequency")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Frequency indicates when exactly the maintenance order has to be created. Ex:- Daily, weekly, etc., ';
                        Image = Setup;
                        RunObject = page "Frequency B2B";
                    }
                    action("Inspection Types")
                    {
                        ApplicationArea = All;
                        ToolTip = 'This is facilitated to pick the Maintenance Types at the Execution area of the maintenance orders and also at the Job Card level.';
                        Image = Setup;
                        RunObject = page "Maintenance Types B2B";
                    }
                    action("Maintenance Unit")
                    {
                        ApplicationArea = All;
                        ToolTip = 'This lookup is facilitated to pick maintenance unit at the job card. This will be displayed in the Preventive Job Card header.';
                        Image = Setup;
                        RunObject = page "Maintenance Unit B2B";
                    }
                    action("Line Types")
                    {
                        ApplicationArea = All;
                        ToolTip = 'This lookup is facilitated to pick the Worksheet Line level to specify the cost.';
                        Image = Setup;
                        RunObject = page "Worksheet Line Types B2B";
                    }
                    action("Complaint Status")
                    {
                        ApplicationArea = All;
                        ToolTip = 'It Defines the Status of the complaints';
                        Image = Setup;
                        RunObject = page "Complaint Status B2B";
                    }
                    action("Machine Status")
                    {
                        ApplicationArea = All;
                        ToolTip = 'It Specifies the Status of the Machine/Equipment.';
                        Image = Setup;
                        RunObject = page "Equipment Status B2B";
                    }
                    action("Machine Usage")
                    {
                        ApplicationArea = All;
                        ToolTip = 'It defines the Usage of Machine/Equipment. Ex:- Chemical, Sewage, etc.,';
                        Image = Setup;
                        RunObject = page "Equipment Usage B2B";
                    }
                    action("Criticality")
                    {
                        ApplicationArea = All;
                        ToolTip = 'It Specifies the Criticality of the Machine/Equipment. Ex:- High, Low etc.,';
                        Image = Setup;
                        RunObject = page "Criticality B2B";
                    }
                    action("Calibration")
                    {
                        ApplicationArea = All;
                        ToolTip = 'It Defines the Calibration of the Intrument.';
                        Image = Setup;
                        RunObject = page "Calibration PLM B2B";
                        ObsoleteState = Pending;
                        ObsoleteReason = 'Functionallity Removed';
                        ObsoleteTag = '21.0';
                    }
                    action("Maintenanced By")
                    {
                        ApplicationArea = All;
                        ToolTip = 'This Look up is used to Specify the Data of Maintenance Department.';
                        Image = Setup;
                        RunObject = page "Maintenanced By B2B";
                    }
                    action("Failure Types")
                    {
                        ApplicationArea = All;
                        ToolTip = 'It Defines the Different types of failures. Ex:- Breakage, Mechanical, Electrical, Leakge, Etc., ';
                        Image = Setup;
                        RunObject = page "Failure Types B2B";
                    }
                    action("Maintenance Schedule Template")
                    {
                        ApplicationArea = All;
                        ToolTip = 'This lookup is facilitated to pick the Equipment Groups in Equipment Card.';
                        Image = Setup;
                        RunObject = page "Maint. ScheduleTemplate B2B";
                    }
                    action("Complaint Line Types")
                    {
                        ApplicationArea = All;
                        ToolTip = 'It Defines the complaint type.';
                        Image = Setup;
                        RunObject = page "Complaint Line Types B2B";
                    }
                    action("Movement Types")
                    {
                        ApplicationArea = All;
                        ToolTip = 'It defines the Movement type of the Equipment. Ex:- Lease, Calibration, etc.,';
                        Image = Setup;
                        RunObject = page "Movement Types B2b";
                    }
                    action("Check List Parameters")
                    {
                        ApplicationArea = All;
                        ToolTip = 'This Lookup facilitates the Parameters in the Checklist.';
                        Image = Setup;
                        RunObject = page "Check List Parameters B2b";
                    }
                    action("Maintenance Work Centers")
                    {
                        ApplicationArea = All;
                        ToolTip = 'This Defiens the Maintenance area';
                        Image = Setup;
                        RunObject = page "Maintenance Work Centers B2b";
                    }
                }

            }
        }
        area(Reporting)
        {
            group("Reports & Analysis")
            {
                action("Equipment Master")
                {
                    ApplicationArea = All;
                    ToolTip = 'It gives the data of the Equipment masters';
                    Image = Report;
                    RunObject = report "Equipment Master b2b";
                }
                action("Machine -Spares List")
                {
                    ApplicationArea = All;
                    ToolTip = 'It gives the data of the Spares list specific to Machine.';
                    Image = Report;
                    RunObject = report "Equipment - Spares List b2b";
                }
                action("PMR Schedule (W/M)")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Provides the PMR Schedule data based on the Frequency.';
                    Image = Report;
                    RunObject = report "PMR Schedule (W/M) b2b";
                }
                action("Machine Details")
                {
                    ApplicationArea = All;
                    ToolTip = 'It gives the Individual Machine complete data.';
                    Image = Report;
                    RunObject = report "Equipment B2B";
                }
                action("Movements")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Provides the Complete Movement data of the Machine.';
                    Image = Report;
                    RunObject = report "Movements B2B";
                }
                action("Preventive Maintenance Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Provides the PM cost of the Equipments';
                    Image = Report;
                    RunObject = report "Preventive Maint. Cost B2B";
                }
                action("Breakdown Analysis")
                {
                    ApplicationArea = All;
                    ToolTip = 'It provides the data of the Breakdown Analysis';
                    Image = Report;
                    RunObject = report "EquipmentWise BreakDown B2B";
                    ;
                }
                action("Maintenance History")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Provides the Maintenance History of the Equipment.';
                    Image = Report;
                    RunObject = report "Equi. Maint.History B2B";
                }
                action("Equipment Job Card History")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Provides the Job card History of the Equiment.';
                    Image = Report;
                    RunObject = report "Equipment Job Card History B2B";
                }
                action("Work Order Tracking Report")
                {
                    ApplicationArea = All;
                    ToolTip = 'It give the Work Order Tracking history.';
                    Image = Report;
                    RunObject = report "Work Order Tracking Report B2B";
                }
                action("Spares List")
                {
                    ApplicationArea = All;
                    ToolTip = 'It porvides the data of the Spares.';
                    Image = Report;
                    RunObject = report "Spares List B2b";
                }
                action("Job Card Details")
                {
                    ApplicationArea = All;
                    ToolTip = 'It provides the Job card Details.';
                    Image = Report;
                    RunObject = report "Job Card Details B2B";
                }
                action("PMR Check List")
                {
                    ApplicationArea = All;
                    ToolTip = 'It provides the PMR checklist data.';
                    Image = Report;
                    RunObject = report "PMR Check List B2b";
                }
            }
        }
    }
}