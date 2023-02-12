
# user control
```csharp
private AdvancedCollectionView _view;

private void
SetFilter(FrameworkElement sender, DataContextChangedEventArgs args)
{
  _view = new AdvancedCollectionView(((ViewModel)this.DataContext).Items, true)
  {
    Filter = item => ((Model)item).WhichView == this.ViewInfo
  };

  (sender as MyUserControl)
    .listView
    .ItemsSource = _view;
}

public MyUserControl()
{
  InitializeComponent();
  DataContextChanged += SetFilter;
}
```

# drag

## DragOver:
```csharp
  args.AcceptedOperation =
    DataPackageOperation.(Copy, Move);
```

## DragItemsStarting:
```csharp
  var draggedItem = args
    .Items
    .FirstOrDefault() as Model;

  args
    .Data
    .SetText(draggedItem.Id.ToString());
```

## DragItemsCompleted:
```csharp
  _view.Refresh();
```

# drop

## Drop:
```csharp
  var id = Guid
    .Parse(await args.DataView.GetTextAsync());

  var item = ((ViewModel)DataContext)
    .Items
    .SingleOrDefault(t => t.Id == id);

  item.WhichView = this.ViewInfo;
  _view.Refresh();
```

