kgl() {
  pod=$(kg pods "$@")
  if [[ -n $pod ]]; then
    echo "Pod: $pod"
    kubectl logs "$pod"
  else
    echo "No pod selected."
  fi
}


kd() {
  first_arg=$1
  item=$(kg "$@")
  if [[ -n $item ]]; then
    echo "$first_arg: $item"
    kubectl describe $first_arg $item
  else
    echo "No pod selected."
  fi
}
kde() {
  first_arg=$1
  item=$(kg "$@")
  if [[ -n $item ]]; then
    echo "$first_arg: $item"
    kubectl delete $first_arg $item
  else
    echo "No pod selected."
  fi
}
kg() {
  first_arg=$1
  shift
  items=$(kubectl get $first_arg | grep -v NAME | awk '{print $1}')
  if [ $1 ]; then
    items=$(echo "$items" | grep $1)
  fi
  line_count=$(echo "$items" | wc -l)
  if [ "$line_count" -gt 1 ]; then
    item=$(echo "$items" | fzf)
  else;
    item=$items
  fi
  echo "$item"
}
