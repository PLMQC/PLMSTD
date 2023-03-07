page 33000983 "Equiment Ledger Entries B2B"
{


    Caption = 'Equiment  Ledger Entries';
    DataCaptionExpression = GetCaption();
    Editable = false;
    PageType = List;
    SourceTable = "Equipment Ledger Entry B2B";
    UsageCategory = History;
    ApplicationArea = all;
    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Shows Posting Date.';
                }
                field("Prod. Order No."; Rec."Prod. Order No.")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Shows Order No.';
                }
                field("Routing No."; Rec."Routing No.")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Shows Routing No.';
                }
                field("Routing Reference No."; Rec."Routing Reference No.")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Shows Routing Reference No.';
                }
                field("Work Center No."; Rec."Work Center No.")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Shows Workcenter No.';
                }
                field(Type; Rec.Type)
                {
                    OptionCaption = '"Work Center,Machine Center, "';
                    ApplicationArea = ALL;
                    ToolTip = 'It Shows Type.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Shows No.';
                }
                field("Document No."; Rec."Document No.")
                {
                    Visible = false;
                    ApplicationArea = ALL;
                    ToolTip = 'It Shows Document No.';
                }
                field("Operation No."; Rec."Operation No.")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Shows Operation No.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'It Shows Item No.';
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Shows Variant Code.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'It Shows Description.';
                }
                field("Work Shift Code"; Rec."Work Shift Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Shows Work Shift Code.';
                }
                field("Starting Time"; Rec."Starting Time")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Shows Starting Time.';
                }
                field("Ending Time"; Rec."Ending Time")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Shows ending Time.';
                }
                field("Concurrent Capacity"; Rec."Concurrent Capacity")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Shows Concurrent Capacity.';
                }
                field("Setup Time"; Rec."Setup Time")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Shows Setup Time.';
                }
                field("Run Time"; Rec."Run Time")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Shows Run time.';
                }
                field("Stop Time"; Rec."Stop Time")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Shows Stop Time.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'It Shows Quantity.';
                }
                field("Output Quantity"; Rec."Output Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Shows O/P Quantity.';
                }
                field("Scrap Quantity"; Rec."Scrap Quantity")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Shows Scrap quantity.';
                }
                field("Direct Cost"; Rec."Direct Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Shows Direct Cost.';
                }
                field("Overhead Cost"; Rec."Overhead Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Shows Overhead Cost.';
                }
                field("Direct Cost (ACY)"; Rec."Direct Cost (ACY)")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Shows Direct Cost (ACY).';
                }
                field("Overhead Cost (ACY)"; Rec."Overhead Cost (ACY)")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Shows Overhead Cost (ACY).';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Shows Department Code.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Shows Project code.';
                }
                field("Stop Code"; Rec."Stop Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Shows Stop code.';
                }
                field("Scrap Code"; Rec."Scrap Code")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Shows scrap code.';
                }
                field("Completely Invoiced"; Rec."Completely Invoiced")
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'It Shows completely invoiced or not.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'It Shows entry number.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Ent&ry")
            {
                Caption = 'Ent&ry';
                Visible = false;
                /*
                action(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ApplicationArea = All;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = CONST(5832),
                                  "No." = FIELD("Entry No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                }*/
                action("&Value Entries")
                {
                    Caption = '&Value Entries';
                    Image = Entries;
                    ApplicationArea = All;
                    ToolTip = 'It Shows value entries.';
                    RunObject = Page "Value Entries";
                    RunPageLink = "Capacity Ledger Entry No." = FIELD("Entry No.");
                    RunPageView = SORTING("Capacity Ledger Entry No.", "Entry Type");
                    ShortCutKey = 'Ctrl+F5';
                }
            }
        }
        area(processing)
        {
            action("&Navigate")
            {
                Caption = '&Navigate';
                Image = Navigate;
                PromotedOnly = true;
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                ToolTip = 'It Defines Navigate action.';
                Visible = false;

                trigger OnAction();
                var
                    Navigate: Page Navigate;
                begin
                    Navigate.SetDoc(Rec."Posting Date", Rec."Prod. Order No.");
                    Navigate.RUN();
                end;
            }
        }
    }

    var
        Text000Lbl: Label 'Machine Center';

    procedure GetCaption(): Text[250];
    var
        ObjTransl: Record "Object Translation";
        WorkCenter: Record "Work Center";
        MachineCenter: Record "Machine Center";
        ProdOrder: Record "Production Order";
        SourceTableName: Text[250];
        SourceFilter: Text[20];
        Description1: Text[100];
    begin
        Rec.Description := '';

        case true of
            Rec.GETFILTER("Work Center No.") <> '':
                begin
                    SourceTableName := ObjTransl.TranslateObject(ObjTransl."Object Type"::Table, 99000754);
                    // SourceFilter := GETFILTER("Work Center No.");
                    if MAXSTRLEN(WorkCenter."No.") >= STRLEN(SourceFilter) then
                        if WorkCenter.GET(SourceFilter) then
                            Description1 := WorkCenter.Name;
                end;
            (Rec.GETFILTER("No.") <> '') and (Rec.GETFILTER(Type) = Text000Lbl):
                begin
                    SourceTableName := ObjTransl.TranslateObject(ObjTransl."Object Type"::Table, 99000758);
                    //SourceFilter := GETFILTER("No.");
                    if MAXSTRLEN(MachineCenter."No.") >= STRLEN(SourceFilter) then
                        if MachineCenter.GET(SourceFilter) then
                            Description1 := MachineCenter.Name;
                end;
            Rec.GETFILTER("Prod. Order No.") <> '':
                begin
                    SourceTableName := ObjTransl.TranslateObject(ObjTransl."Object Type"::Table, 5405);
                    //SourceFilter := GETFILTER("Prod. Order No.");
                    if MAXSTRLEN(ProdOrder."No.") >= STRLEN(SourceFilter) then
                        if ProdOrder.GET(ProdOrder.Status::Released, SourceFilter) or
                           ProdOrder.GET(ProdOrder.Status::Finished, SourceFilter)
                        then begin
                            SourceTableName := STRSUBSTNO('%1 %2', ProdOrder.Status, SourceTableName);
                            Description1 := ProdOrder.Description;
                        end;
                end;
        end;
        //exit(STRSUBSTNO('%1 %2 %3', SourceTableName, SourceFilter, Description1));
    end;
}

