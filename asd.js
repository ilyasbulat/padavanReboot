function peak(arr) {
	//..
	for (let i = 1; i < arr.length; i++) {
		if (
			arr.slice((0, i)).reduce((sum, el) => {
				return sum + el;
			}) ==
			arr.slice(i + 1).reduce((sum, el) => {
				return sum + el;
			})
		) {
			return i;
		}
	}
	return -1;
}
