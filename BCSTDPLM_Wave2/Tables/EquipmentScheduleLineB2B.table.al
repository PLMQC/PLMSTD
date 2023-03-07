table 33000896 "Equipment Schedule Line B2B"
{

    Caption = 'Equipment Schedule Line';
    DrillDownPageID = "Equipment Schedule List B2B";
    LinkedObject = false;
    LookupPageID = "Equipment Schedule List B2B";
    DataClassification = CustomerContent;

    fields
    {
        field(2; "Schedule Template ID"; Code[20])
        {
            Caption = 'Schedule Template ID';
            DataClassification = CustomerContent;
        }
        field(3; "Line Type"; Code[20])
        {
            Caption = 'Line Type';
            TableRelation = "Line Type B2B";
            DataClassification = CustomerContent;

            trigger OnValidate();
            var
                PLMSetup: Record "Plant Maintenance Setup B2B";
                GLAcc: Record "G/L Account";
            begin
                if LineType.GET("Line Type") then begin
                    "Line Type Name" := LineType.Description;
                    "Resource Equipment" := LineType."Resource Equipment";
                    "Spares & Consumables" := LineType."Spares & Consumables";
                    "Resource Person" := LineType."Resource Person";
                end else begin
                    "Line Type Name" := '';
                    "Resource Equipment" := false;
                    "Spares & Consumables" := false;
                end;
                IF LineType.Service THEN BEGIN
                    PLMSetup.GET();
                    "I/R Code" := PLMSetup."G/L Account No.";
                    GLAcc.GET(PLMSetup."G/L Account No.");
                    "I/R Description" := GLAcc.Name;
                END;
            end;
        }
        field(4; "Line Type Name"; Code[50])
        {
            Caption = 'Description';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(5; Description; Text[250])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(6; "Sl.No."; Integer)
        {
            Caption = 'Sl.No.';
            DataClassification = CustomerContent;
        }
        field(7; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(20; "Time Required"; Decimal)
        {
            Caption = 'Time Required';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                Amount := "Time Required" * "Unit Cost";
            end;
        }
        field(21; "I/R Code"; Code[20])
        {
            Caption = 'I/R Code';
            DataClassification = CustomerContent;

            trigger OnLookup();
            begin
                MachineSetup.GET();
                if Item.GET("I/R Code") then;
                if ResourceRec.GET("I/R Code") then;

                Item.RESET();
                ResourceRec.RESET();
                SpareRec.RESET();

                if LineType.GET("Line Type") then begin
                    if LineType."Spares & Consumables" then begin
                        Item.SETRANGE(Item."Item Category Code", MachineSetup."Item Category Code");
                        if PAGE.RUNMODAL(0, Item) = ACTION::LookupOK then begin
                            "I/R Code" := Item."No.";
                            "I/R Description" := Item.Description;
                            UOM := Item."Base Unit of Measure";
                            "Unit Cost" := Item."Unit Cost"
                        end;
                    end;


                    if LineType."Resource Equipment" or LineType."Resource Person" then begin
                        if LineType."Resource Equipment" then
                            ResourceRec.SETRANGE(ResourceRec.Type, ResourceRec.Type::Machine)
                        else begin
                            ResourceRec.SETRANGE(ResourceRec.Type, ResourceRec.Type::Person);
                            MaintSchPart.SETRANGE("No.", "Schedule Template ID");
                            MaintSchPart.FINDFIRST();

                            PMResSkill.SETRANGE("Machine No.", MaintSchPart."Machine ID");
                            if PMResSkill.FINDFIRST() then
                                repeat
                                    ResourceRec.GET(PMResSkill."No.");
                                    ResourceRec.MARK(true);
                                until PMResSkill.NEXT() = 0;


                            ResourceVar.SETRANGE("Skill Type B2B", ResourceVar."Skill Type B2B"::All);
                            ResourceVar.SETRANGE(Type, ResourceVar.Type::Person);
                            if ResourceVar.FINDFIRST() then
                                repeat
                                    ResourceRec.GET(ResourceVar."No.");
                                    ResourceRec.MARK(true);
                                until ResourceVar.NEXT() = 0;
                            ResourceRec.MARKEDONLY(true);
                        end;
                        if PAGE.RUNMODAL(0, ResourceRec) = ACTION::LookupOK then begin
                            "I/R Code" := ResourceRec."No.";
                            "I/R Description" := ResourceRec.Name;
                            UOM := ResourceRec."Base Unit of Measure";
                            "Unit Cost" := ResourceRec."Unit Cost";

                        end;
                    end;
                end;
            end;

            trigger OnValidate();
            begin
                TESTFIELD("Line Type");
                Item.RESET();
                ResourceRec.RESET();

                if LineType.GET("Line Type") then begin
                    if LineType."Spares & Consumables" then
                        if Item.GET("I/R Code") then begin
                            "I/R Code" := Item."No.";
                            "I/R Description" := Item.Description;
                            UOM := Item."Base Unit of Measure";
                            "Unit Cost" := Item."Unit Cost"
                        end else
                            ERROR(Text001Lbl);


                    if LineType."Resource Equipment" or LineType."Resource Person" then begin
                        ResourceRec.SETRANGE("No.", "I/R Code");
                        if ResourceRec.GET("I/R Code") then begin
                            "I/R Code" := ResourceRec."No.";
                            "I/R Description" := ResourceRec.Name;
                            UOM := ResourceRec."Base Unit of Measure";
                            "Unit Cost" := ResourceRec."Unit Cost"
                        end else
                            ERROR(Text002Lbl);
                    end;
                end;
            end;
        }
        field(22; "I/R Description"; Text[100])
        {
            Caption = 'Name/ Description';
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(23; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                Amount := Quantity * "Unit Cost";
            end;
        }
        field(24; "Unit Cost"; Decimal)
        {
            Caption = 'Unit Cost';
            DataClassification = CustomerContent;

            trigger OnValidate();
            begin
                if LineType.GET("Line Type") then begin
                    if (LineType."Resource Equipment") or ((LineType."Resource Person")) then
                        Amount := "Time Required" * "Unit Cost";
                    if LineType."Spares & Consumables" then
                        Amount := Quantity * "Unit Cost";
                end;
            end;
        }
        field(25; UOM; Code[10])
        {
            Caption = 'Unit of Measure';
            TableRelation = "Unit of Measure";
            DataClassification = CustomerContent;
        }
        field(26; Amount; Decimal)
        {
            Caption = 'Amount';
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(29; "Resource Equipment"; Boolean)
        {
            Caption = 'Resource Equipment';
            DataClassification = CustomerContent;
        }
        field(30; "Spares & Consumables"; Boolean)
        {
            Caption = 'Spares & Consumables';
            DataClassification = CustomerContent;
        }
        field(36; "Resource Person"; Boolean)
        {
            Caption = 'Resource Person';
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Schedule Template ID", "Line No.")
        {
            SumIndexFields = "Time Required";
        }
        key(Key2; "Line Type Name", "Sl.No.")
        {
        }
        key(Key3; "Sl.No.")
        {
        }
        key(Key4; "Line No.")
        {
        }
        key(Key5; "Schedule Template ID", "Line Type")
        {
            SumIndexFields = Amount;
        }
        key(Key6; "Schedule Template ID", "Line Type Name", "Line No.")
        {
            SumIndexFields = Amount;
        }
        key(Key7; "Schedule Template ID", "Spares & Consumables")
        {
            SumIndexFields = Amount;
        }
        key(Key8; "Schedule Template ID", "Resource Equipment")
        {
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    var
        MachineSetup: Record "Plant Maintenance Setup B2B";
        Item: Record Item;
        PMResSkill: Record "PM Resource Skill B2B";
        ResourceVar: Record Resource;

        ResourceRec: Record Resource;
        LineType: Record "Line Type B2B";
        MaintSchPart: Record "Maintenance Schedule Part B2B";
        SpareRec: Record "Spare B2B";
        Text001Lbl: Label 'Item No. does not exist';
        Text002Lbl: Label 'Resource No. does not exist';
}

