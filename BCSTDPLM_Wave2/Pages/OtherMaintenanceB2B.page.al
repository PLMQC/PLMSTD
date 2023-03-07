page 33000963 "Other Maintenance B2B"
{

    Caption = 'Other Maintenance';
    PageType = Card;
    UsageCategory = Tasks;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            field("Equipment No."; MachineNo)
            {
                ApplicationArea = ALL;
                ToolTip = 'It Defines The machine no.';
                Caption = 'Equipment No.';

                trigger OnLookup(Var Text: Text): Boolean;
                begin
                    CLEAR(MachineNo);
                    CLEAR(NameVar);
                    CLEAR(Descriptions);
                    if PAGE.RUNMODAL(0, Machine) = ACTION::LookupOK then begin
                        MachineNo := Machine."No.";
                        NameVar := Machine.Name;
                    end;
                end;

                trigger OnValidate();
                begin
                    CLEAR(NameVar);
                    CLEAR(Descriptions);
                    CLEAR(InspectionTypes);
                end;
            }
            field(Name; NameVar)
            {
                ApplicationArea = ALL;
                ToolTip = 'It Defines machine name.';
                Caption = 'Name';
                Editable = false;
            }
            field(Description; Descriptions)
            {
                ApplicationArea = ALL;
                ToolTip = 'It Defines description.';
                Caption = 'Description';
            }
            field(InspectionType; InspectionTypes)
            {
                ApplicationArea = ALL;
                ToolTip = 'It Defines Inspection type.';
                Caption = 'Maintenace Type';
                TableRelation = "Maintenance Type B2B";
            }

            field(Date; Datevar)
            {
                ApplicationArea = ALL;
                ToolTip = 'It Defines Date.';
                Caption = 'Date';
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("P&osting")
            {

                Caption = 'P&osting';
                action("P&ost")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Defines posting function.';
                    Caption = 'P&ost';
                    Ellipsis = true;
                    Image = Post;
                    ShortCutKey = 'F9';

                    trigger OnAction();
                    begin

                        Equipment.RESET();
                        Equipment.SETRANGE("No.", MachineNo);
                        if Equipment.FINDFIRST() then
                            if Equipment."Year of Purchase" > Datevar then
                                ERROR(EquipmentDateErr);

                        Machine.CreateOthersMaintenanceJob(MachineNo, Descriptions, InspectionTypes, DateVar);
                        CLEAR(MachineNo);
                        CLEAR(NameVar);
                        CLEAR(Descriptions);
                        CLEAR(InspectionTypes);
                    end;
                }
            }
        }
    }

    var
        Equipment: Record "Equipment B2B";
        Machine: Record "Equipment B2B";
        MachineNo: Code[20];
        NameVar: Text[50];
        Descriptions: Text[50];
        InspectionTypes: Code[10];
        EquipmentDateErr: Label 'Date must not be less than Equipment purchase date';
        DateVar: Date;
}

